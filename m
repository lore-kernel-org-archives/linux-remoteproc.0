Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 2 Jun 2017 10:55:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 3/4] remoteproc: qcom: Make secure world call for mem
 ownership switch
Message-ID: <20170602175540.GD12920@tuxbook>
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-4-git-send-email-akdwived@codeaurora.org>
 <20170601204224.GB12920@tuxbook>
 <613203ac-a1a1-05b1-db5c-a48003003b53@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <613203ac-a1a1-05b1-db5c-a48003003b53@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 01 Jun 14:42 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:

> Hi Bjorn,
> 
> Thanks lot many for such a blazing fast response :)
> 
> regarding your points.
> 
> a- Do you mean caller's of q6v5_xfer_mem_ownership() should pass two
> additional inputs i.e. *next_perm and *next_vmid
> 

You have two cases; assign to HLOS and assign to MSS, so I imagine that
you pass a single indicator of which you want to assign. I.e. rather
than looking at what the current state is and flipping you pass the
conditional of that if statement as a parameter.

>     and that based on successful return of qcom_scm_assign () they should be
> treated as *current_perm and *current_vmid
> 

Instead of your index, you take a "int *curr_perms", which you use as
the current vmid list and you assign at the end of the function (like
you do today).

So to transfer the ownership to the MSS you would make a function call
like:

ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_owner, ..., true);

mpss_owner would have to be initialize to HLOS before calling this, but
will always be holding the current value.

>    by caller? if so caller will have to do flipping between MSS and HLOS,
> isn't it?
> 

As far as I can see each call to this driver is either a "transfer to
MSS" or "transfer to HLOS", so that shouldn't be a problem.

>    Also code churning will increase this way, and also logging the way is
> being handled now may require to change again.
> 
>    or am i misunderstanding your proposal?
> 

Could be that I'm missing something, if above doesn't make sense please
do let me know.

>    Sorry for inconvenience, but if you could through little more light, that
> will help.
> 

There's no inconvenience, thanks for reaching out for clarifications on
my comments.

Regards,
Bjorn

> 
> -Avaneesh
> 
> 
> On 6/2/2017 2:12 AM, Bjorn Andersson wrote:
> > On Thu 01 Jun 12:17 PDT 2017, Avaneesh Kumar Dwivedi wrote:
> > 
> > > MSS proc on msm8996 can not access fw loaded region without stage
> > > second translation of memory pages where mpss image are loaded.
> > > This patch in order to enable mss boot on msm8996 invoke scm call
> > > to switch or share ownership between apps and modem.
> > > 
> > Overall this looks good now, I have two minor notes that I want you to
> > fix up though.
> > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> > > @@ -288,6 +290,40 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
> > >   	return &table;
> > >   }
> > > +static int q6v5_xfer_mem_ownership(struct q6v5 *qproc,
> > > +				   int image, phys_addr_t addr,
> > Rather than relying on a static int to keep track of current permissions
> > pass a "int *current_perms", that you update on success.
> > 
> > Add int mba_perm and int mpss_perm to the struct q6v5 and initialize
> > them in probe and just keep the metadata_perm on the stack in
> > q6v5_mpss_init_image.
> > 
> > > +				   size_t size)
> > > +{
> > > +	static int current_owner[3][1] = {{BIT(QCOM_SCM_VMID_HLOS)},
> > > +			{BIT(QCOM_SCM_VMID_HLOS)},
> > > +			{BIT(QCOM_SCM_VMID_HLOS)} };
> > > +	struct qcom_scm_vmperm next[] = {{0} };
> > You don't need to initialize this, and if you just keep it "struct
> > qcom_scm_vmperm next" you can pass it as &next in the
> > qcom_scm_assign_mem() call.
> > 
> > > +	int ret;
> > > +
> > > +	if (!qproc->need_mem_protection)
> > > +		return 0;
> > > +
> > > +	if (current_owner[image][0] == BIT(QCOM_SCM_VMID_HLOS)) {
> > And rather than making this flip back and forth with every call, I think
> > it's more robust if you pass the new expected owner as a parameter to
> > the function. Simplest way I can think of it to add a "bool
> > remote_owner" as a parameter; it makes the changes minimal and works
> > with the naming of the function.
> > 
> > > +		next->vmid = QCOM_SCM_VMID_MSS_MSA;
> > > +		next->perm = QCOM_SCM_PERM_RW;
> > > +	} else {
> > > +		next->vmid = QCOM_SCM_VMID_HLOS;
> > > +		next->perm = QCOM_SCM_PERM_RWX;
> > > +	}
> > > +
> > > +	ret = qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> > > +		current_owner[image][0], next, 1);
> > > +	if (ret < 0) {
> > > +		pr_err("Failed to assign %s memory access in range %p to %p ret = %d\n",
> > > +			(image == 0 ? "MDT" : image == 1 ? "MBA" : "MPSS"),
> > > +			(void *)addr, (void *)(addr + size), ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	current_owner[image][0] = ret;
> > > +	return 0;
> > > +}
> > > +
> > Regards,
> > Bjorn
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
> 
