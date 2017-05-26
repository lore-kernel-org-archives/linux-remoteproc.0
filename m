Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 26 May 2017 12:17:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND: PATCH v4 3/4] remoteproc: qcom: Make secure world call
 for mem ownership switch
Message-ID: <20170526191747.GJ12920@tuxbook>
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-4-git-send-email-akdwived@codeaurora.org>
 <20170526021651.GF12920@tuxbook>
 <a061dff7-fc09-9d03-3d8b-d72a1e84e049@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a061dff7-fc09-9d03-3d8b-d72a1e84e049@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 26 May 06:19 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:

> 
> 
> On 5/26/2017 7:46 AM, Bjorn Andersson wrote:
> > On Tue 16 May 11:02 PDT 2017, Avaneesh Kumar Dwivedi wrote:
> > > @@ -471,6 +517,11 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
> > >   		dev_err(qproc->dev,
> > >   			"metadata authentication failed: %d\n", ret);
> > > +	/* Metadata authentication done, remove modem access */
> > > +	ret = q6v5_assign_mem_to_linux(qproc, phys, fw->size);
> > > +	if (ret)
> > > +		dev_err(qproc->dev,
> > > +			"Failed to reclaim metadata memory, ret - %d\n", ret);
> > If this assignment fails (for any reason) we can't return the memory to
> > the free pool in Linux, because at some point in the future these pages
> > will be allocated to someone else resulting in a memory access violation
> > scenario that will be just terrible to debug.
> > 
> > I do however not have a better idea at the moment than just leaking the
> > memory.
> Then shall we BUG_ON here itself?

Here we have the chance to "handle" the problem (by leaking the memory),
so it's not a catastrophic error. But perhaps better to replace the
dev_err() with a WARN(ret, "failed to reclaim memory\n"); that way this
issue will stand out in the log.

[..]
> > > @@ -656,16 +719,21 @@ static int q6v5_start(struct rproc *rproc)
[..]
> > >   	}
> > > +	ret = q6v5_assign_mem_to_linux(qproc,
> > > +		qproc->mba_phys, qproc->mba_size);
> > > +	if (ret)
> > > +		dev_err(qproc->dev,
> > > +			"Failed to reclaim mba memory, ret - %d\n", ret);
> > I think it's okay for symmetrical purposes to keep the memory assigned
> > to the remote until we call stop().
> Actually MBA image is transferred into internal memory of q6 and does not
> run from DDR
> that is why it is OK to release it here. let me know if you dont want to do
> that.

Leave it here, but please add a comment above this snippet saying
something like:

/*
 * The MBA is transferred to internal memory of the Q6 and no longer
 * need access.
 */

[..]
> > > +	assign_mem_result =
> > > +		q6v5_assign_mem_to_linux(qproc,
> > > +		qproc->mba_phys, qproc->mba_size);
> > Shouldn't we move them even further down?
> There does not seem any restriction w.r.t. keeping it here.
> Do you think any side effect ?

No, I'm fine with this if you say that the MPSS is no longer executing
anything at this point.

Thanks,
Bjorn
