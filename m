Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 18 Nov 2016 09:23:21 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: add Venus video core firmware
 loader driver
Message-ID: <20161118172321.GC2769@tuxbot>
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-4-git-send-email-stanimir.varbanov@linaro.org>
 <20161114191641.GH5177@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161114191641.GH5177@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 14 Nov 11:16 PST 2016, Stephen Boyd wrote:

> On 11/07, Stanimir Varbanov wrote:
> > +#include <linux/module.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/qcom_scm.h>
> > +#include <linux/remoteproc.h>
> > +
> > +#include "qcom_mdt_loader.h"
> > +#include "remoteproc_internal.h"
> > +
> > +#define VENUS_CRASH_REASON_SMEM		425
> 
> This is unused. Is there going to be some common smem API to get
> the crash reason?

There are a couple of these operations that are good candidates to be
shared between all Qualcomm remoteproc drivers. I just haven't spent the
time to figure out how to properly splice it.

For the crash reason specifically, there are three operations done in
the other drivers; read-and-null-terminate, then this is outputed to the
log, also indicating what type of event we had. And finally the
remoteproc core is informed about the crash, with a event-type passed
and we get another line in the log based on that, i.e. there's room for
a few improvements in this area.

Regards,
Bjorn
