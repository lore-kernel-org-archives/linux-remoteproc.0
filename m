Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 14 Apr 2017 09:46:00 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] soc: qcom: Add support of scm call for mss rproc
 to share access of ddr
Message-ID: <20170414164600.GR70446@Bjorns-MacBook-Pro-2.local>
References: <1488996202-1546-1-git-send-email-akdwived@codeaurora.org>
 <1488996202-1546-2-git-send-email-akdwived@codeaurora.org>
 <20170406044349.GA15143@minitux>
 <6043c6f6-be31-8655-8660-884ff62994c4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6043c6f6-be31-8655-8660-884ff62994c4@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 14 Apr 06:54 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
> On 4/6/2017 10:13 AM, Bjorn Andersson wrote:
> > On Wed 08 Mar 10:03 PST 2017, Avaneesh Kumar Dwivedi wrote:
[..]
> > > +int __qcom_scm_assign_mem(struct device *dev, struct vmid_detail vmid)
> > Rather than packing these parameters up in a struct I think it's cleaner
> > to just pass them directly.
> passing so many parameters directly is not seen good practice specially when
> number of parameters to pass are many.
> that is why i used struct copy, i did not use reference of struct since
> values passed were not going to be modified.
> but will surely look if i can work with direct passing of params.

It's a good rule of thumb, but in this case you have 1 caller and 2
implementations (don't forget to stub the 32-bit one), so the overhead
of having a struct just to pass these parameters probably is not worth
it.

And the fact that some of the members have slightly different meanings
here compared to the other API is a bigger issue.

> > 
> > > +{
> > > +	int ret;
> > > +	struct qcom_scm_desc desc = {0};
> > > +	struct arm_smccc_res res;
> > > +
> > > +	desc.args[0] = vmid.fw_phy;
> > > +	desc.args[1] = vmid.size_fw;
> > > +	desc.args[2] = vmid.from_phy;
> > > +	desc.args[3] = vmid.size_from;
> > > +	desc.args[4] = vmid.to_phy;
> > > +	desc.args[5] = vmid.size_to;
> > > +	desc.args[6] = 0;
> > > +
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
> > Please be explicit about the fact that this is 64 bit.
> sorry i am not sure why they need to be 64 bit variable?

__le32 says that elements are 32-bits, * says this is a pointer to such
elements and as we are on a 64-bit system this member is 64-bit.

This is a binary interface between the Linux kernel and the TrustZone
code, so the struct must be encoded in exactly the same way on both
sides.


As Stephen suggested, making this __le64 would make this way more
obvious - and endian safe.

> > 
> > > +	__le32 ctx_size;
> > > +};
[..]
> > > +int qcom_scm_assign_mem(struct vmid_detail vmid)
> > After a long discussion with Stephen I now think that I understand
> > what's actually going on here.
> > 
> > So this function will request TZ to remove all permissions for the
> > memory region in the tables specified in "from" and then for each vmid
> > in "to" it will set up the specified "permission".
> > 
> > So the "to" and "permissions" are actually a tuple, rather than
> > independent lists of values. So I think this should be exposed in the
> > prototype, as a list of <vmid, permission> entries.
> > 
> > To make the function prototype more convenient I think you should turn
> > "from" into a bitmap (e.g. BIT(VMID_HLOS) | BIT(VMID_MSS_MSA)).
> i am not able to fully comprehend advantage of turning "from" into bitmap.
> moreover when i read your below suggestion, which suggest to use "struct
> qcom_scm_mem_perm" as below then i get further confused what i will do with
> bitmap?

Every time you call this function you have to pass a list of "from" that
corresponds to the "to" of the last (successful) call to this function.

In your code this means that the "from" is either 1 or 2 elements and as
you can see in your own code there is no convenient way of doing this in
C - having an array of 2 elements and claiming that it is either 1 or 2
entries long is not very clean.

Further more, in the remoteproc driver you currently rely on the fact
that you "know", in each code path, what the last "to" was and just hard
code "from". But if you make this call return the next "from" as a
bitmap (much more convenient than a variable length array) we can store
this in the driver for each memory region and I believe the calling code
will be cleaner.

> > 
> > If you then make the function, on success, return "to" as a bitmap the
> > caller can simply store that in a state variable and pass it as "from"
> > in the next call.
> > 
> > So you would have:
> > 
> >    struct qcom_scm_mem_perm new_perms[] = {
> >    	{ VMID_HLOS, PERM_READ },	
> >    	{ VMID_MSS_MSA, PREM_READ | PERM_WRITE },
> >    };
> >    current_perms = qcom_scm_assign_mem(ptr, size, current_perms, new_perms, 2);
> This looks OK, will try to incorporate this idea.
> > 
> > 
> > And I believe something like "curr_perm" and "new_perm" are even better
> > names than "from" and "to"
> ok.
> > 
[..]
> > > +
> > > +	/* copy detail of original owner of ddr region */
> > > +	/* in physically contigious buffer */
> > > +	memcpy(from, vmid.from, vmid.size_from);
> > With "from" as a bitmap see hweight_long() to figure out the size of
> > "from".
> 
> hweight_long() returns number of bits set in bitmap? is this correct understanding?
> 

Correct.

[..]
> > > diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
[..]
> > > +
> > > +#define VMID_HLOS	0x3
> > > +#define VMID_MSS_MSA	0xF
> > > +#define PERM_READ	0x4
> > > +#define PERM_WRITE	0x2
> > > +#define PERM_EXEC	0x1
> > > +#define PERM_RW	(PERM_READ | PERM_WRITE)
> > These belongs in the SCM API instead. (Prefix them appropriately)
> Do you mean something like SCM_VMID_HLOS?

This is part of the qcom-scm API, other defines there are of the form
QCOM_SCM_* so QCOM_SCM_VMID_HLOS should be ok.

> > 
> > >   static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
> > >   			       const struct qcom_mss_reg_res *reg_res)
> > >   {
> > > @@ -288,6 +309,54 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
> > >   	return &table;
> > >   }
> > > +int hyp_mem_access(int id, phys_addr_t addr, size_t size)
> > I much prefer the downstream split and naming of this function, rather
> > than using a switch to implement 4 different functions in one please
> > split it up.
> so you mean i need to have seprate function for each "int id"? in switch
> case?

Yes.

> just for sake of minimum code churn i tried to work with single function.
> 

In terms of C-code you have 1 function, but conceptually you have 4 - so
any reasoning about what this function does fully depends on "id" as
well.

[..]
> > 
> > 
> > And as far as I can tell the downstream driver load the segments and
> > then make the MSS sole owner of the memory region. Do note that it's
> > perfectly fine to refactor code to make things better fit a natural and
> > easy to follow flow of ownership here!
> Not very clear what to do?

In order to hand over ownership completely we can no longer verify the
segments as we load them - we will have to do this in two steps.

So I believe this code has to be refactored to make this in two separate
steps - with the latter done after we transmit the ownership of the
memory to the remote.

Regards,
Bjorn
