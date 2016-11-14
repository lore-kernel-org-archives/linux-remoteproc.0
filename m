Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Mon, 14 Nov 2016 11:42:16 +0000
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v10 01/11] remoteproc: st_slim_rproc: add a slimcore
 rproc driver
Message-ID: <20161114114216.GA8986@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1476783556-2501-1-git-send-email-peter.griffin@linaro.org>
 <1476783556-2501-2-git-send-email-peter.griffin@linaro.org>
 <20161103213703.GA15449@tuxbot>
 <20161107135735.GA27280@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161114051854.GW3000@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161114051854.GW3000@localhost>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, ohad@wizery.com, patrice.chotard@st.com, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Vinod,

On Mon, 14 Nov 2016, Vinod Koul wrote:

> On Mon, Nov 07, 2016 at 01:57:35PM +0000, Peter Griffin wrote:
> > > 
> > > As you now make changes to the entire remoteproc Kconfig file, rather
> > > than simply add a Kconfig symbol we can't bring this in via Vinod's tree
> > > without providing Linus with a messy merge conflict.
> > > 
> > > So the remoteproc parts now has to go through my tree.
> > 
> > OK, I think the best approach is for Vinod to create an immutable
> > branch with the entire fdma series on, and then both of you merge that branch into
> > your respective trees.
> 
> my topic/st_fdma is immutable branch. You cna merge it, if you need a signed
> tag, please do let me know

OK.

> 
> > 
> > That way there won't be any conflicts and you can both accept further changes
> > for v4.9 release. Trying to take half the series via rproc, and half via dma trees won't work
> > because they have dependencies on each other.
> > 
> > I will send a v11 series in a moment which includes the feedback in this email
> > and also include the additional fixes which Vinod has applied since the driver
> > has been in linux-next.
> 
> WHY.. Stuff is already merged twice!

When the feedback is "there is an unrelated change in this patch", the only way
you can fix that is by having a new version of the patch.

>Please send updated on top of already
> merged code!

You have dropped the remoteproc parts which were updated in v11, so
it is no longer merged. Bjorn can now pick the v11 versions if he chooses which
incporporates his feedback.

>This is how kernel developement is done...

regards,

Peter.
