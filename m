Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 22 Dec 2017 14:28:31 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: Add label for GLINK bindings
Message-ID: <20171222222831.GF478@tuxbook>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-2-git-send-email-clew@codeaurora.org>
 <20171220183000.rhxgyikfqzxmqkjo@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171220183000.rhxgyikfqzxmqkjo@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: Chris Lew <clew@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 20 Dec 10:30 PST 2017, Rob Herring wrote:

> On Mon, Dec 18, 2017 at 02:02:09PM -0800, Chris Lew wrote:
> > Add a label property to identify the edge this node represents.
> 
> Why does a user need to know this?
> 

Each SMD or GLINK edge will expose a dev node as /dev/rpmsg_ctrlX that
can be used create dev nodes for channels that user space wants to
access directly (without a specific kernel driver).

The problem is that there's currently nothing in the device hierarchy
that identifies which edge, and hence remoteproc, these channels are
associated with.

So for SMD I added the ability to specify a "label" on the SMD edge,
which is propagated in sysfs and allows me to write udev rules creating
symlinks based on the edge name (e.g. /dev/modem/DIAG vs /dev/rpmsg4)
and it also allows user space tools to figure out which channels comes
from the same edge/remoteproc (e.g. which DIAG control channel is
related to which DIAG data channel).

This patch attempts to add the equivalent property on GLINK edges.


As SMD and GLINK edges can exist without a parent remoteproc (e.g. for
the always-on subsystems) and it's possible for a single remoteproc to
have multiple edges, it's inadequate to put this label on the
remoteproc.


PS. Downstream solutions of remoteproc + virtio-rpmsg has "solved" this
problem by using aliases for remoteprocs and then only allow one
virtio-rpmsg node per remoteproc, to get deterministic identification of
channels.

Regards,
Bjorn
