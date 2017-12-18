Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/6] rpmsg: glink: Expose rpmsg name attr for glink
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-5-git-send-email-clew@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <1d29f603-b113-9931-d7b6-980c959b8b6b@codeaurora.org>
Date: Mon, 18 Dec 2017 14:48:28 -0800
MIME-Version: 1.0
In-Reply-To: <1513634534-22861-5-git-send-email-clew@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Chris Lew <clew@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/18/2017 02:02 PM, Chris Lew wrote:
> Expose the name field as an attr so clients listening to uevents for
> rpmsg can identify the edge the events correspond to.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 786f2eca01f1..a897ccea3098 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1558,6 +1558,22 @@ static void qcom_glink_work(struct work_struct *work)
>  	}
>  }
>  
> +static ssize_t rpmsg_name_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +	struct qcom_glink_device *gdev = to_glink_device(rpdev);
> +
> +	return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", gdev->glink->name);
> +}
> +static DEVICE_ATTR_RO(rpmsg_name);
> +
> +static struct attribute *qcom_glink_attrs[] = {

const?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
