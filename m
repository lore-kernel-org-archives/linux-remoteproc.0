Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v2 2/3] remoteproc: qcom: Add scm call to protect modem
 mem in mss rproc drv.
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
 <1485773044-31489-3-git-send-email-akdwived@codeaurora.org>
 <20170228071632.GG25384@codeaurora.org>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <eae8acc4-caa5-51b8-092d-78a37ebb9338@codeaurora.org>
Date: Fri, 3 Mar 2017 23:35:30 +0530
MIME-Version: 1.0
In-Reply-To: <20170228071632.GG25384@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 2/28/2017 12:46 PM, Stephen Boyd wrote:
> On 01/30, Avaneesh Kumar Dwivedi wrote:
>> This patch add hypervisor call support for second stage translation from
>> mss remoteproc driver, this is required so that modem on msm8996 which is
>> based on armv8 architecture can access DDR region where modem firmware
>> are loaded.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
> Most of this should be combined with patch 1 from this series.
OK.
>
>>   drivers/remoteproc/qcom_q6v5_pil.c | 202 ++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 198 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index e5edefa..35eee68 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -93,6 +93,23 @@
>>   #define QDSS_BHS_ON			BIT(21)
>>   #define QDSS_LDO_BYP			BIT(22)
>>   
>> +struct dest_vm_and_perm_info {
>> +	__le32 vm;
>> +	__le32 perm;
>> +	__le32 *ctx;
>> +	__le32 ctx_size;
>> +};
>> +
>> +struct mem_prot_info {
>> +	__le64 addr;
>> +	__le64 size;
>> +};
>> +
>> +struct scm_desc {
>> +	__le32 arginfo;
>> +	__le64 args[10];
>> +};
> These are all firmware specific things that should live in scm
> code, not PIL code.
OK.
>
>> +
>>   struct reg_info {
>>   	struct regulator *reg;
>>   	int uV;
>> @@ -111,6 +128,7 @@ struct rproc_hexagon_res {
>>   	struct qcom_mss_reg_res active_supply[2];
>>   	char **proxy_clk_names;
>>   	char **active_clk_names;
>> +	int version;
>>   };
>>   
>>   struct q6v5 {
>> @@ -152,8 +170,29 @@ struct q6v5 {
>>   	phys_addr_t mpss_reloc;
>>   	void *mpss_region;
>>   	size_t mpss_size;
>> +	int version;
>> +	int protection_cmd;
>> +};
>> +
>> +enum {
>> +	MSS_MSM8916,
>> +	MSS_MSM8974,
>> +	MSS_MSM8996,
>>   };
>>   
>> +enum {
>> +	ASSIG_ACCESS_MSA,
>> +	REMOV_ACCESS_MSA,
>> +	SHARE_ACCESS_MSA,
>> +	REMOV_SHARE_MSA,
>> +};
>> +
>> +#define VMID_HLOS	0x3
>> +#define VMID_MSS_MSA	0xF
>> +#define PERM_READ	0x4
>> +#define PERM_WRITE	0x2
>> +#define PERM_EXEC	0x1
>> +#define PERM_RW	(0x4 | 0x2)
> Please USE PERM_READ | PERM_WRITE here instead.
OK.
>
>>   static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
>>   				const struct qcom_mss_reg_res *reg_res)
>>   {
>> @@ -273,12 +312,123 @@ static void q6v5_clk_disable(struct device *dev,
>>   		clk_disable_unprepare(clks[i]);
>>   }
>>   
>> +int hyp_mem_access(struct q6v5 *qproc, phys_addr_t addr, size_t size)
> This could be the scm API for now. But instead of taking qproc,
> it would take the protection_cmd variable (which looks sort of
> like a state machine BTW). To be more generic, perhaps it should
> take the src vmids + num src vmids, dst vmids + num dst vmids,
> and protection flags (which looks to be same size as dst vmid
> array). If we can get the right SCM API here everything else
> should fall into place.
Will analyses and modify as per suggestion.
>
>> +{
>> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>> +	struct dest_vm_and_perm_info *dest_info;
>> +	struct mem_prot_info *mem_prot_info;
>> +	struct scm_desc desc = {0};
>> +	__le32 *source_vm_copy;
>> +	__le64 mem_prot_phy;
>> +	int dest_count = 1;
>> +	int src_count = 1;
>> +	__le32 *perm = {0};
>> +	__le32 *dest = {0};
>> +	__le32 *src = {0};
> src/dst seem like pretty confusing names. It makes it sound like
> a memcpy operation. Perhaps from/to is better? Or current/next.
OK
>
>> +	__le64 phys_src;
>> +	__le64 phy_dest;
>> +	int ret;
>> +	int i;
>> +
>> +	if (qproc->version != MSS_MSM8996)
>> +		return 0;
>> +
>> +	switch (qproc->protection_cmd) {
>> +		case ASSIG_ACCESS_MSA: {
>> +			src = (int[2]) {VMID_HLOS, 0};
>> +			dest = (int[2]) {VMID_MSS_MSA, 0};
>> +			perm = (int[2]) {PERM_READ | PERM_WRITE, 0};
> Why have two element arrays when we're only using the first
> element? Relying on default src_count of 1 is very confusing.
in some cases we initialize two elements.
>
>> +			break;
>> +		}
>> +		case REMOV_ACCESS_MSA: {
>> +			src = (int[2]) {VMID_MSS_MSA, 0};
>> +			dest = (int[2]) {VMID_HLOS, 0};
>> +			perm = (int[2]) {PERM_READ | PERM_WRITE | PERM_EXEC, 0};
> Same here.
OK.
>
>> +			break;
>> +		}
>> +		case SHARE_ACCESS_MSA: {
>> +			src = (int[2]) {VMID_HLOS, 0};
>> +			dest = (int[2]) {VMID_HLOS, VMID_MSS_MSA};
>> +			perm = (int[2]) {PERM_RW, PERM_RW};
> Please add spaces around curly braces like { this }
OK.
>
>> +			dest_count = 2;
>> +			break;
>> +		}
>> +		case REMOV_SHARE_MSA: {
> And write REMOVE_SHARE_MSA, ASSIGN_ACCESS_MSA, etc. instead of
> dropping letters.
OK.
>
>> +			src = (int[2]) {VMID_HLOS, VMID_MSS_MSA};
>> +			dest = (int[2]) {VMID_HLOS, 0};
>> +			perm = (int[2]) {PERM_READ | PERM_WRITE | PERM_EXEC, 0};
>> +			src_count = 2;
>> +			break;
>> +		}
>> +		default: {
> And also drop curly braces around case statements.
OK.
>
>> +			break;
>> +		}
>> +	}
>> +
>> +	source_vm_copy = dma_alloc_attrs(qproc->dev,
> This should really allocate from the scm->dev instead of qproc.
> We don't know if qproc has the same DMA attributes that the
> firmware has, but we know that we're trying to relay information
> to the firmware here, not the qproc.
OK, agree.
>
>> +				src_count*sizeof(*source_vm_copy), &phys_src,
>> +				GFP_KERNEL, dma_attrs);
>> +	if (!source_vm_copy) {
>> +		dev_err(qproc->dev,
>> +			"failed to allocate buffer to pass source vmid detail\n");
>> +		return -ENOMEM;
>> +	}
>> +	memcpy(source_vm_copy, src, sizeof(*source_vm_copy) * src_count);
>> +
>> +	dest_info = dma_alloc_attrs(qproc->dev,
>> +			dest_count*sizeof(*dest_info), &phy_dest,
>> +			GFP_KERNEL, dma_attrs);
>> +	if (!dest_info) {
>> +		dev_err(qproc->dev,
>> +			"failed to allocate buffer to pass destination vmid detail\n");
>> +		return -ENOMEM;
>> +	}
>> +	for (i = 0; i < dest_count; i++) {
>> +		dest_info[i].vm = dest[i];
>> +		dest_info[i].perm = perm[i];
> Needs to do a cpu_to_le32() somewhere. Please run sparse.
I understand that byte reordering needed but not sure what is sparse 
will check and do it.
>
>> +		dest_info[i].ctx = NULL;
>> +		dest_info[i].ctx_size = 0;
>> +	}
> Perhaps we should just allocate these first (one or two elements
> isn't a big difference) and then fill the details in directly.
Not very clear what is ask here?
>
>> +
>> +	mem_prot_info = dma_alloc_attrs(qproc->dev,
>> +				sizeof(*mem_prot_info), &mem_prot_phy,
>> +				GFP_KERNEL, dma_attrs);
>> +	if (!dest_info) {
>> +		dev_err(qproc->dev,
>> +				"failed to allocate buffer to pass protected mem detail\n");
>> +		return -ENOMEM;
>> +	}
>> +	mem_prot_info->addr = addr;
>> +	mem_prot_info->size = size;
>> +
>> +	desc.args[0] = mem_prot_phy;
>> +	desc.args[1] = sizeof(*mem_prot_info);
>> +	desc.args[2] = phys_src;
>> +	desc.args[3] = sizeof(*source_vm_copy) * src_count;
>> +	desc.args[4] = phy_dest;
>> +	desc.args[5] = dest_count*sizeof(*dest_info);
> Please add spaces around '*'. Run checkpatch.
OK.
>
>> +	desc.args[6] = 0;
>> +
>> +	ret = qcom_scm_assign_mem(&desc);
>> +	if (ret)
>> +		pr_info("%s: Failed to assign memory protection, ret = %d\n",
> pr_err? dev_err?
Will correct.
>
>> +			__func__, ret);
>> +
>> +	/* SCM call has returned free up buffers passed to secure domain */
>> +	dma_free_attrs(qproc->dev, src_count*sizeof(*source_vm_copy),
>> +		source_vm_copy, phys_src, dma_attrs);
>> +	dma_free_attrs(qproc->dev, dest_count*sizeof(*dest_info),
>> +		dest_info, phy_dest, dma_attrs);
>> +	dma_free_attrs(qproc->dev, sizeof(*mem_prot_info), mem_prot_info,
>> +		mem_prot_phy, dma_attrs);
>> +	return ret;
>> +}
>> +
>>   static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>>   {
>>   	struct q6v5 *qproc = rproc->priv;
>>   
>>   	memcpy(qproc->mba_region, fw->data, fw->size);
>> -
> Please remove this patch noise.
OK.
>
>>   	return 0;
>>   }

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
