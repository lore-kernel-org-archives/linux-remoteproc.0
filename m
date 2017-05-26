Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 25 May 2017 23:03:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND: PATCH v4 1/4] firmware: scm: Add new SCM call for
 switching memory ownership
Message-ID: <20170526060341.GG12920@tuxbook>
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494957722-13264-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 16 May 11:01 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index 93e3b96..4eb7d59 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -596,3 +596,9 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
>  {
>  	return -ENODEV;
>  }
> +int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_addr,
> +		size_t mem_sz, phys_addr_t srcVm, size_t srcVm_sz,
> +		phys_addr_t destVm, size_t destVm_sz)
> +{
> +return -ENODEV;

Indentation please.

> +}
[..]
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index bb16510..a2363e2 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -40,6 +40,24 @@ struct qcom_scm {
>  	struct reset_controller_dev reset;
>  };
>  
> +struct qcom_scm_current_perm_info {
> +	__le32 destVm;

__le32 vmid;

> +	__le32 destVmPerm;

__le32 perm;

> +	__le64 ctx;
> +	__le32 ctx_size;
> +};
> +
> +struct qcom_scm_mem_map_info {
> +	__le64 mem_addr;
> +	__le64 mem_size;
> +};
> +
> +struct qcom_scm_hyp_map_info {
> +	__le32 srcVm[2];
> +	struct qcom_scm_mem_map_info mem_region;
> +	struct qcom_scm_current_perm_info destVm[2];
> +};

As described below, both arrays in this struct should be dynamic size,
so I recommend dropping the struct and just do the offset math yourself
in the function.

> +
>  static struct qcom_scm *__scm;
>  
>  static int qcom_scm_clk_enable(void)
> @@ -292,6 +310,63 @@ int qcom_scm_pas_shutdown(u32 peripheral)
>  }
>  EXPORT_SYMBOL(qcom_scm_pas_shutdown);
>  
> +/**
> + * qcom_scm_assign_mem() - Provide interface to request to map a memory
> + * region into intermediate physical address table as well map
> + * access permissions for any other proc on SOC. So that when other proc
> + * applies the same intermediate physical address passed by requesting
> + * processor in this case apps proc, on memory bus it can access the
> + * region without fault.

The first line should be a short description of the function.

> + * @mem_addr: Start pointer of region which need to be mapped.
> + * @mem_sz: Size of the region.
> + * @srcVm: Detail of current owners, each set bit in flag indicate id of
> + * shared owners.
> + * @newVm: Details of new owners and permission flags for each of them.
> + * @newVm_sz: Size of array pointed by newVm.

If necessary (appropriate in your case) a longer description should go
here - with blank lines before and after.

> + * Return 0 on success.

For more info on the format, please see:

https://www.kernel.org/doc/Documentation/kernel-doc-nano-HOWTO.txt

> + */
> +int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcVm,
> +		struct qcom_scm_destVmPerm *newVm, size_t newVm_sz)

It's more idiomatic to pass the number of elements in an array than the
size of the array, so make newVm_sz be the number of items.

And please refrain from using camelCase in the Linux kernel.

> +{
> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> +	struct qcom_scm_hyp_map_info *hmi;

Skip this struct and just store the base address in a void *, then have
one pointer for each of the substructures (to help fill them in).

> +	phys_addr_t addr[3];
> +	size_t size[3];

Please give these 6 variables names.

> +	int ret;
> +	int i;
> +
> +	hmi = dma_alloc_attrs(__scm->dev, sizeof(*hmi),
> +			&addr[1], GFP_KERNEL, dma_attrs);

This function should handle arbitrary number of src and destination vms;
so start by calculating the hweight of the source, allocate the
appropriate amount of srcVM and dstVM space and then calculate the
offsets within that block for each entry.


Check and handle !hmi

> +	hmi->mem_region.mem_addr = cpu_to_le64(mem_addr);
> +	hmi->mem_region.mem_size = cpu_to_le64(mem_sz);
> +
> +	addr[0] = addr[1] + sizeof(hmi->srcVm);
> +	size[0] = sizeof(hmi->mem_region);
> +
> +	ret = hweight_long(srcVm);
> +	for (i = 0; i < ret; i++) {
> +		hmi->srcVm[i] = cpu_to_le32(ffs(srcVm) - 0x1);

Subtract 1, rather than 0x1

> +		srcVm ^= 1 << (ffs(srcVm) - 0x1);

Make this easier to read with:

	for (...) {
		vmid = ffs(srcVm) - 1;

		hmi->srcVm[i] = cpu_to_le32(vmid);
		srcVm &= ~BIT(vmid);
	}

> +	}
> +	size[1] = ret * sizeof(srcVm);
> +
> +	ret = newVm_sz/sizeof(struct qcom_scm_destVmPerm);
> +	for (i = 0; i < ret; i++) {
> +		hmi->destVm[i].destVm = cpu_to_le32(newVm[i].destVm);
> +		hmi->destVm[i].destVmPerm = cpu_to_le32(newVm[i].destVmPerm);
> +		hmi->destVm[i].ctx = 0;
> +		hmi->destVm[i].ctx_size = 0;
> +	}
> +	addr[2] = addr[0] + sizeof(hmi->mem_region);
> +	size[2] = ret * sizeof(struct qcom_scm_current_perm_info);
> +
> +	ret = __qcom_scm_assign_mem(__scm->dev, addr[0],
> +		size[0], addr[1], size[1], addr[2], size[2]);
> +	dma_free_attrs(__scm->dev, sizeof(*hmi), hmi, addr[1], dma_attrs);
> +	return ret;

As discussed on IRC, please return negative on failure and otherwise a
bitmap built from the vmids in the destination list.

Also note that when I tested this last time I saw
__qcom_scm_assign_mem() return positive numbers even though the mapping
seemed broken afterwards. So it could be that you should treat any
return value as some sort of error.

> +}
> +EXPORT_SYMBOL(qcom_scm_assign_mem);
[..]
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index e538047..cb930d9 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -23,6 +23,18 @@ struct qcom_scm_hdcp_req {
>  	u32 val;
>  };
>  
> +struct qcom_scm_destVmPerm {

There's no harm in dropping "dest" from this, and please drop the
camelCase.

> +	int destVm;

int vmid;

> +	int destVmPerm;

int perm;

> +};
> +
> +#define QCOM_SCM_VMID_HLOS       0x3
> +#define QCOM_SCM_VMID_MSS_MSA    0xF
> +#define QCOM_SCM_PERM_READ       0x4
> +#define QCOM_SCM_PERM_WRITE      0x2
> +#define QCOM_SCM_PERM_EXEC       0x1
> +#define QCOM_SCM_PERM_RW (QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)

Add QCOM_SCM_PERM_RWX, as this looks fairly common as well.

> +

Regards,
Bjorn
