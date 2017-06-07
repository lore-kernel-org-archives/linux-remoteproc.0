Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Jun 2017 14:20:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 3/4] remoteproc: qcom: Make secure world call for mem
 ownership switch
Message-ID: <20170607212026.GI12920@tuxbook>
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-4-git-send-email-akdwived@codeaurora.org>
 <20170601204224.GB12920@tuxbook>
 <613203ac-a1a1-05b1-db5c-a48003003b53@codeaurora.org>
 <20170602175540.GD12920@tuxbook>
 <ea7b7065-6520-eb1f-b6f3-3b2e7138cc31@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea7b7065-6520-eb1f-b6f3-3b2e7138cc31@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 07 Jun 09:27 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:

> 
> 
> On 6/2/2017 11:25 PM, Bjorn Andersson wrote:
> > On Thu 01 Jun 14:42 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
> > 
> > > Hi Bjorn,
> > > 
> > > Thanks lot many for such a blazing fast response :)
> > > 
> > > regarding your points.
> > > 
> > > a- Do you mean caller's of q6v5_xfer_mem_ownership() should pass two
> > > additional inputs i.e. *next_perm and *next_vmid
> > > 
> > You have two cases; assign to HLOS and assign to MSS, so I imagine that
> > you pass a single indicator of which you want to assign. I.e. rather
> > than looking at what the current state is and flipping you pass the
> > conditional of that if statement as a parameter.
> OK
> > 
> > >      and that based on successful return of qcom_scm_assign () they should be
> > > treated as *current_perm and *current_vmid
> > > 
> > Instead of your index, you take a "int *curr_perms", which you use as
> > the current vmid list and you assign at the end of the function (like
> > you do today).
> > 
> > So to transfer the ownership to the MSS you would make a function call
> > like:
> > 
> > ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_owner, ..., true);
> > 
> > mpss_owner would have to be initialize to HLOS before calling this, but
> > will always be holding the current value.
> i am not finding compelling enough region to carry an input pointer to hold
> current ownership
> specially when i am carrying a boolean flag to check whether next->vmid will
> be MSS or HLOS
> I mean where am i going to use this current owner info in mss rproc driver,
> i am yet not getting enough reason.
> while the local array did job of maintaining and flipping the ownership
> based on info if which image ownership transfer is being called.
> 

As far as I can see your patch works fine, every code path will end up
calling xfer_mem() an even number of times, meaning that when we're done
the ownership is on the HLOS side.

But the reason I don't like this flip-flop mechanism is that it forces
us to _always_ exit every code path with an even number of calls.
Meaning that if we ever refactor any of this code and accidentally add
another flip, we will start seeing "random" crashes. This is the reason
why I want the code to be explicit in "transfer permission to X".

The reason for not using the "destination owner" for figuring out the
current owner is that in the even that you call "transfer permission to
HLOS" twice in a row, you will call TZ saying that the current ownership
is MSS and the call will fail. In this case the calling code has no
chance to know if we failed because we have called xfer_mem() an odd
number of times or something else and although we are good (HLOS is
owner) we have to treat this as a fatal error.


So, it's all about future maintainability - not about it currently
working.

Regards,
Bjorn
