Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 8 Dec 2016 10:59:46 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Add support for "label" property
Message-ID: <20161208185946.GL30492@tuxbot>
References: <1480716362-23467-1-git-send-email-bjorn.andersson@linaro.org>
 <e74860e9-db5b-00c6-1804-60862041a930@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e74860e9-db5b-00c6-1804-60862041a930@redhat.com>
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 08 Dec 04:14 PST 2016, Jeremy McNicoll wrote:

> On 2016-12-02 2:06 PM, Bjorn Andersson wrote:
> >Add support for the "label" property, used to give the edge a name other
> >than the one of the DT node. This allows the implementor to provide
> >consistently named edges when using the rpmsg character device.
> >
> >Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >---
> >
> >Changes since v1:
> >- Moved sysfs attribute to the correct (this) patch
> >
> > drivers/rpmsg/qcom_smd.c | 22 ++++++++++++++++++++++
> > 1 file changed, 22 insertions(+)
> >
> 
> Could you please add something to Documentation/devicetree/bindings/
> showing this "label" property.
> 
> Or add a "label" to an existing DTS so people/implementors  have a reference
> if they so choose to use this property.
> 

The DT binding update was already in flight and has been Acked by Rob
and Andy. I just didn't get the implementation out until now.

You can find it here:
https://patchwork.kernel.org/patch/9385753/

Thanks for having a look.

Regards,
Bjorn
