Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH 4/4] remoteproc: Get rid of tedious error path
References: <e5e03d6b-46bd-5ece-a7f6-3cb557c3b0b0@web.de>
From: Alex Elder <elder@linaro.org>
Message-ID: <3c2ea363-e60f-b3ef-e66f-df8d558972bf@linaro.org>
Date: Tue, 14 Apr 2020 07:27:39 -0500
MIME-Version: 1.0
In-Reply-To: <e5e03d6b-46bd-5ece-a7f6-3cb557c3b0b0@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/14/20 3:53 AM, Markus Elfring wrote:
> …
>> +++ b/drivers/remoteproc/remoteproc_core.c
> …
>> @@ -2105,11 +2104,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> …
>> +out:
>> +	put_device(&rproc->dev);
> 
> How do you think about to use the label “put_device”?

+1

> 
> Regards,
> Markus
> 
