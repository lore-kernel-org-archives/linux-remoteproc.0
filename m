Return-Path: <s-anna@ti.com>
Subject: Re: [v2 5/7] remoteproc: Restructure firmware name allocation
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
 <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
 <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
From: Suman Anna <s-anna@ti.com>
Message-ID: <9d3e4511-27f4-3523-a90c-2ff64d1d9c89@ti.com>
Date: Fri, 17 Apr 2020 11:15:50 -0500
MIME-Version: 1.0
In-Reply-To: <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/17/20 10:48 AM, Markus Elfring wrote:
>>>      p = firmware ? kstrdup_const(…) : kasprintf(…);
>>
>> For simple assignments, I too prefer the ternary operator,
> 
> Thanks for your feedback.
> 
> 
>> but in this case, I think it is better to leave the current code as is.
> 
> Would you like to consider the use of the function “kvasprintf_const”
> according to your review comment for the update step “[PATCH v2 4/7] remoteproc:
> Use kstrdup_const() rather than kstrup()”?

This patch is just swapping the condition order, so will automatically 
be adjusted for any changes in patch 4 during the rebase.

regards
Suman
