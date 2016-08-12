Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 12 Aug 2016 15:42:23 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
Message-ID: <20160812224223.GJ26240@tuxbot>
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
 <20160812183448.GA32059@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160812183448.GA32059@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 12 Aug 11:34 PDT 2016, Rob Herring wrote:

> On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
> > This documents the generic properties "rprocs" and "rproc-names", used
> > for consumer drivers to reference a remoteproc node.
> 
> How do you intend to use this? I wonder if it would not be better to 
> expose a remote proc with existing bindings for a particular purpose 
> (e.g. clocks, resets, etc.) rather than a generic connection. The client 
> side would have to have specific knowledge as to what functions the 
> remote proc provides.
> 

The remoteproc node represents the mechanism and resources needed to
control the life cycle a co-processor, e.g. loading, booting, shutting
gown a video encoder/decoder.

The proposed reference allows a separate thingie to assert control of
the life cycle of that co-processor.


I acknowledge that in some cases there is a fine line between what is
the life cycle management and what is the actual functionality
implemented by that remote processor. But as the remoteproc mechanism is
reusable between various use cases I think it makes sense to not describe
them as one unit.

Regards,
Bjorn
