Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 10 Jul 2017 16:31:46 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
Message-ID: <20170710233146.GE1618@tuxbook>
References: <1498133333-21291-1-git-send-email-akdwived@codeaurora.org>
 <1498133333-21291-2-git-send-email-akdwived@codeaurora.org>
 <20170707224956.GK22780@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170707224956.GK22780@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 07 Jul 15:49 PDT 2017, Stephen Boyd wrote:

> On 06/22, Avaneesh Kumar Dwivedi wrote:
> > diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
[..]
> > +int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcvm,
> > +			struct qcom_scm_vmperm *newvm, int dest_cnt)
> > +{
> > +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> 
> Why do we need this? Just curious if we can drop this.
> 

As far as I can see this attribute has no affect on the allocation,
unless you have attached an iommu to the device. So in the current setup
it should be perfectly fine to get the memory from dma_alloc_coherent()

> > +	struct qcom_scm_current_perm_info *destvm;
> > +	struct qcom_scm_mem_map_info *mem;
> > +	phys_addr_t memory_phys;
> > +	phys_addr_t dest_phys;
> > +	phys_addr_t src_phys;
> > +	size_t mem_all_sz;
> > +	size_t memory_sz;
> > +	size_t dest_sz;
> > +	size_t src_sz;
> > +	int next_vm;
> > +	__le32 *src;
> > +	void *ptr;
> > +	int ret;
> > +	int len;
> > +	int i;
> > +
> > +	src_sz = hweight_long(srcvm) * sizeof(*src);
> > +	memory_sz = sizeof(*mem);
> > +	dest_sz = dest_cnt*sizeof(*destvm);
> > +	mem_all_sz = src_sz + memory_sz + dest_sz;
> > +
> > +	ptr = dma_alloc_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
> > +		&src_phys, GFP_KERNEL, dma_attrs);
> > +	if (!ptr)
> > +		return -ENOMEM;
> > +
> > +	/* Fill source vmid detail */
> > +	src = (__le32 *)ptr;
> 
> Cast is necessary?
> 
> > +	len = hweight_long(srcvm);
> > +	for (i = 0; i < len; i++) {
> > +		src[i] = cpu_to_le32(ffs(srcvm) - 1);
> > +		srcvm ^= 1 << (ffs(srcvm) - 1);
> > +	}
> > +
> > +	/* Fill details of mem buff to map */
> > +	mem = ptr + ALIGN(src_sz, SZ_64);
> > +	memory_phys = src_phys + ALIGN(src_sz, SZ_64);
> > +	mem[0].mem_addr = cpu_to_le64(mem_addr);
> > +	mem[0].mem_size = cpu_to_le64(mem_sz);
> > +
> > +	next_vm = 0;
> > +	/* Fill details of next vmid detail */
> > +	destvm = ptr + ALIGN(memory_sz, SZ_64) + ALIGN(src_sz, SZ_64);
> > +	dest_phys = memory_phys + ALIGN(memory_sz, SZ_64);
> > +	for (i = 0; i < dest_cnt; i++) {
> > +		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
> > +		destvm[i].perm = cpu_to_le32(newvm[i].perm);
> > +		destvm[i].ctx = 0;
> > +		destvm[i].ctx_size = 0;
> > +		next_vm |= BIT(newvm[i].vmid);
> > +	}
> > +
> > +	ret = __qcom_scm_assign_mem(__scm->dev, memory_phys,
> > +		memory_sz, src_phys, src_sz, dest_phys, dest_sz);
> > +	dma_free_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
> > +		ptr, src_phys, dma_attrs);
> > +	if (ret == 0)
> > +		return next_vm;
> > +	else if (ret > 0)
> > +		return -ret;
> 
> This still confuses me. Do we really just pass whatever the
> firmware tells us the error code is up to the caller? Shouldn't
> we be remapping the scm errors we receive to normal linux errnos?
> 

I agree, the one case I've seen this not being 0 on "success" it was 15
and I consider it wrong to return ENOTBLK when this happens.

It would be better to just return -EINVAL in this case.

> > +	return ret;
> > +}

Regards,
Bjorn
