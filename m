Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 14 Apr 2017 10:59:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] soc: qcom: Add support of scm call for mss rproc
 to share access of ddr
Message-ID: <20170414175924.GS70446@Bjorns-MacBook-Pro-2.local>
References: <1488996202-1546-1-git-send-email-akdwived@codeaurora.org>
 <1488996202-1546-2-git-send-email-akdwived@codeaurora.org>
 <20170405234448.GO7065@codeaurora.org>
 <a8123857-e4e8-e365-f982-65bd7b65fa02@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8123857-e4e8-e365-f982-65bd7b65fa02@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 14 Apr 07:01 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
> On 4/6/2017 5:14 AM, Stephen Boyd wrote:
> > On 03/08, Avaneesh Kumar Dwivedi wrote:
[..]
> > > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > > index 893f953ea..f137f34 100644
> > > --- a/drivers/firmware/qcom_scm.c
> > > +++ b/drivers/firmware/qcom_scm.c
> > > @@ -42,6 +42,18 @@ struct qcom_scm {
> > >   static struct qcom_scm *__scm;
> > > +struct dest_vm_and_perm_info {
> > > +	__le32 vm;
> > > +	__le32 perm;
> > > +	__le32 *ctx;
> > Drop the pointer? Just treat it like another number? Pointer is
> > really odd because it doesn't really make any sense what the
> > address of the pointer would be.
> Downstream this is pointer though unused, that is why kept same will check
> and change.

The problem is that the size of a pointer depends on which platform
you're on. Spelling out __le32 here is then just deceiving.

> > 
> > > +	__le32 ctx_size;
> > > +};
[..]
> > > +int qcom_scm_assign_mem(struct vmid_detail vmid)
[..]
> > > +	ret = __qcom_scm_assign_mem(__scm->dev, vmid);
> > > +	if (!ret)
> > > +		goto free_fw_buff;
> > > +	return ret;
> > We don't free dma on failure?
> Did not get, isnt i am freeing all dma allocs on failure?

In the event that __qcom_scm_assign_mem() returns non-zero your not
jumping to free_fw_buff and just returning "ret" without freeing
the memory.

[..]
> > > diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> > > index 3584b00..4665a11 100644
> > > --- a/drivers/firmware/qcom_scm.h
> > > +++ b/drivers/firmware/qcom_scm.h
> > > @@ -55,6 +55,9 @@ extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
> > >   extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
> > >   extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
> > >   extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
> > > +#define QCOM_SCM_SVC_MP	0xc
> > This is already defined upstream?
> Will check, but i thought its not there.

We use the qcom_scm-api to abstract these facts, so this is an internal
constant - as such it goes in drivers/firmware/qcom_scm.h - and it's
already defined.

Regards,
Bjorn
