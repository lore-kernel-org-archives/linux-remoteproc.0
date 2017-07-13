Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 22:54:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v6 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
Message-ID: <20170713055404.GS22780@codeaurora.org>
References: <1498133333-21291-1-git-send-email-akdwived@codeaurora.org>
 <1498133333-21291-2-git-send-email-akdwived@codeaurora.org>
 <20170707224956.GK22780@codeaurora.org>
 <13defb94-dac3-097d-f3c6-088385b909a5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13defb94-dac3-097d-f3c6-088385b909a5@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 07/12, Dwivedi, Avaneesh Kumar (avani) wrote:
> 
> 
> On 7/8/2017 4:19 AM, Stephen Boyd wrote:
> >On 06/22, Avaneesh Kumar Dwivedi wrote:
> >>diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> >>index 6e6d561..cdfe986 100644
> >>--- a/drivers/firmware/qcom_scm-64.c
> >>+++ b/drivers/firmware/qcom_scm-64.c
> >>@@ -292,6 +304,86 @@ int qcom_scm_pas_shutdown(u32 peripheral)
> >>  }
> >>  EXPORT_SYMBOL(qcom_scm_pas_shutdown);
> >>+/**
> >>+ * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
> >>+ *
> >>+ * @mem_addr: mem region whose ownership need to be reassigned
> >>+ * @mem_sz:   size of the region.
> >>+ * @srcvm:    vmid for current set of owners, each set bit in
> >>+ *            flag indicate a unique owner
> >>+ * @newvm:    array having new owners and corrsponding permission
> >>+ *            flags
> >>+ * @dest_cnt: number of owners in next set.
> >>+ * Return next set of owners on success.
> >>+ */
> >>+int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcvm,
> >>+			struct qcom_scm_vmperm *newvm, int dest_cnt)
> >>+{
> >>+	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> >Why do we need this? Just curious if we can drop this.
> The force contiguous flag is required with dma_alloc_attrs() api to
> allocate memory from physically contiguous zone.
> I am not sure, are you saying that api will work without the
> attribute or you mean i shall use some api which does not take
> explicit attribute?

Does physically contiguous zone mean some CMA carveout? I wasn't
aware of a carveout for scm devices. I'm still not following the
reasoning here.

I'm saying that I don't understand why we need this flag. It
feels like this sort of constraint would apply all over the scm
driver if it was true, hence the confusion.

> >>+
> >>+	ret = __qcom_scm_assign_mem(__scm->dev, memory_phys,
> >>+		memory_sz, src_phys, src_sz, dest_phys, dest_sz);
> >>+	dma_free_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
> >>+		ptr, src_phys, dma_attrs);
> >>+	if (ret == 0)
> >>+		return next_vm;
> >>+	else if (ret > 0)
> >>+		return -ret;
> >This still confuses me. Do we really just pass whatever the
> >firmware tells us the error code is up to the caller? Shouldn't
> >we be remapping the scm errors we receive to normal linux errnos?
> because i do not know in advance what exactly will be the return
> error code, moreover there are number of error codes which are
> returned in case of failure
> so if i have to return linux error code, i can not do one to one
> mapping of error code and will have to return single error code for
> all failure.
> let me know your comments further on this.+ return ret;

Yes, returning -EINVAL all the time is fine if we can't remap the
error. In fact, we should probably do what we do downstream and
print out the error value returned from the firmware to the
kernel log and then return some sane errno up to the caller. That
way the few people who know what the error codes mean can tell us
why the scm call failed.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
