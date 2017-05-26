Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RESEND: PATCH v4 3/4] remoteproc: qcom: Make secure world call
 for mem ownership switch
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-4-git-send-email-akdwived@codeaurora.org>
 <20170526021651.GF12920@tuxbook>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <a061dff7-fc09-9d03-3d8b-d72a1e84e049@codeaurora.org>
Date: Fri, 26 May 2017 18:49:45 +0530
MIME-Version: 1.0
In-Reply-To: <20170526021651.GF12920@tuxbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 5/26/2017 7:46 AM, Bjorn Andersson wrote:
> On Tue 16 May 11:02 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> +static int q6v5_assign_mem_to_subsys(struct q6v5 *qproc,
>> +		phys_addr_t addr, size_t size)
>> +{
>> +	struct qcom_scm_destVmPerm next[] = {{ QCOM_SCM_VMID_MSS_MSA,
>> +		(QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)} };
> struct qcom_scm_destVmPerm next = {
> 	.vmid = QCOM_SCM_VMID_MSS_MSA,
> 	.perm = QCOM_SCM_PERM_RW
> };
OK.
>
>> +	int ret;
>> +
>> +	size = ALIGN(size, SZ_4K);
> I believe it will be cleaner if you just put this alignment directly in
> the function call below.
OK.
>
>> +	if (!qproc->need_mem_protection)
>> +		return 0;
> Put a blank line here, to give separation between the sections of the
> function.
OK.
>
>> +	ret = qcom_scm_assign_mem(addr, size,
>> +		BIT(QCOM_SCM_VMID_HLOS), next, sizeof(next));
> 	qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> 			    BIT(QCOM_SCM_VMID_HLOS), &next, 1);
OK
>
>> +	if (ret)
>> +		pr_err("%s: Failed to assign memory access, ret = %d\n",
>> +			__func__, ret);
> There's no point in printing an error here and in the calling function,
> but as it makes sense to have the error message to include which memory
> region we operated on (mba vs mpss) I think you should remove the print
> here and keep it in the callers.
OK
>
> So just return qcom-scm_assign_mem().
OK
>
>> +	return ret;
>> +}
>> +
>> +static int q6v5_assign_mem_to_linux(struct q6v5 *qproc,
>> +		phys_addr_t addr, size_t size)
>> +{
>> +	struct qcom_scm_destVmPerm next[] = { { QCOM_SCM_VMID_HLOS,
>> +		(QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_EXEC)}
>> +		};
> struct qcom_scm_destVmPerm next = {
> 	.vmid = QCOM_SCM_VMID_HLOS,
> 	.perm = QCOM_SCM_PERM_RWX,
> };
>
> (And add RWX to the list of defines in patch 1)
OK
>
> [..]
>> @@ -471,6 +517,11 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>   		dev_err(qproc->dev,
>>   			"metadata authentication failed: %d\n", ret);
>>   
>> +	/* Metadata authentication done, remove modem access */
>> +	ret = q6v5_assign_mem_to_linux(qproc, phys, fw->size);
>> +	if (ret)
>> +		dev_err(qproc->dev,
>> +			"Failed to reclaim metadata memory, ret - %d\n", ret);
> If this assignment fails (for any reason) we can't return the memory to
> the free pool in Linux, because at some point in the future these pages
> will be allocated to someone else resulting in a memory access violation
> scenario that will be just terrible to debug.
>
> I do however not have a better idea at the moment than just leaking the
> memory.
Then shall we BUG_ON here itself?
>
>>   	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
>>   
>>   	return ret < 0 ? ret : 0;
> [..]
>> @@ -656,16 +719,21 @@ static int q6v5_start(struct rproc *rproc)
>>   
>>   	ret = q6v5_mpss_load(qproc);
>>   	if (ret)
>> -		goto halt_axi_ports;
>> +		goto reclaim_mem;
> This doesn't allow us to distinguish between failures before or after
> the memory assignment in mpss_load(), so although you're duplicating the
> reclaim code, mpss_load() must be responsible of restoring the state on
> failure.
OK, will move one of reclaim path in mpss_load it self.
>
> The timeout below still has to reclaim the memory.
Yes that any way will do.
>
>>   
>>   	ret = wait_for_completion_timeout(&qproc->start_done,
>>   					  msecs_to_jiffies(5000));
>>   	if (ret == 0) {
>>   		dev_err(qproc->dev, "start timed out\n");
>>   		ret = -ETIMEDOUT;
>> -		goto halt_axi_ports;
>> +		goto reclaim_mem;
>>   	}
>>   
>> +	ret = q6v5_assign_mem_to_linux(qproc,
>> +		qproc->mba_phys, qproc->mba_size);
>> +	if (ret)
>> +		dev_err(qproc->dev,
>> +			"Failed to reclaim mba memory, ret - %d\n", ret);
> I think it's okay for symmetrical purposes to keep the memory assigned
> to the remote until we call stop().
Actually MBA image is transferred into internal memory of q6 and does 
not run from DDR
that is why it is OK to release it here. let me know if you dont want to 
do that.
>
> Although this shows that we should be able to release the mba allocation
> here.
Yes that is true.
>
>>   	qproc->running = true;
>>   
>>   	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
>> @@ -675,12 +743,19 @@ static int q6v5_start(struct rproc *rproc)
>>   
>>   	return 0;
>>   
>> +reclaim_mem:
>> +	assign_mem_result =
>> +		q6v5_assign_mem_to_linux(qproc,
>> +		qproc->mpss_phys, qproc->mpss_size);
> If this fails we're screwed. We have no way to fail in a way that will
> not free the memory at any later point in time.
>
> So I do believe you should have a BUG_ON(assign_mem_result); here. With
> a clear comment in the lines of:
>
> /*
>   * Failed to reclaim memory, any future access to these pages will cause
>   * security violations and a seemingly random crash
>   */
Yes this is very good suggestion thanks.
>>   halt_axi_ports:
>>   	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>>   	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>>   	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>>   	q6v5_clk_disable(qproc->dev, qproc->active_clks,
>>   			 qproc->active_clk_count);
>> +	assign_mem_result =
>> +		q6v5_assign_mem_to_linux(qproc,
>> +		qproc->mba_phys, qproc->mba_size);
> Shouldn't we move them even further down?
There does not seem any restriction w.r.t. keeping it here.
Do you think any side effect ?
>
> Same BUG_ON() as above.
Yes sure.
>
>>   assert_reset:
>>   	reset_control_assert(qproc->mss_restart);
>>   disable_vdd:
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
