Return-Path: <jmcnicol@redhat.com>
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Add support for "label" property
References: <1480716362-23467-1-git-send-email-bjorn.andersson@linaro.org>
From: Jeremy McNicoll <jmcnicol@redhat.com>
Message-ID: <e74860e9-db5b-00c6-1804-60862041a930@redhat.com>
Date: Thu, 8 Dec 2016 04:14:02 -0800
MIME-Version: 1.0
In-Reply-To: <1480716362-23467-1-git-send-email-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2016-12-02 2:06 PM, Bjorn Andersson wrote:
> Add support for the "label" property, used to give the edge a name other
> than the one of the DT node. This allows the implementor to provide
> consistently named edges when using the rpmsg character device.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Moved sysfs attribute to the correct (this) patch
>
>  drivers/rpmsg/qcom_smd.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>

Could you please add something to Documentation/devicetree/bindings/
showing this "label" property.

Or add a "label" to an existing DTS so people/implementors  have a 
reference if they so choose to use this property.

Thanks.

-jeremy
