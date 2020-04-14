Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH 1/4] remoteproc: Fix a bug in rproc_alloc()
References: <e459f807-4c61-257b-b7b5-dd767202c435@web.de>
From: Alex Elder <elder@linaro.org>
Message-ID: <4b05d794-095b-7efe-c71c-42dca785ca49@linaro.org>
Date: Tue, 14 Apr 2020 07:27:14 -0500
MIME-Version: 1.0
In-Reply-To: <e459f807-4c61-257b-b7b5-dd767202c435@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/14/20 3:24 AM, Markus Elfring wrote:
>> I'm not actually sure this case causes an observable problem, but
>> it's incorrect.  Fix this by initializing the notifyids field before
>> calling ida_simple_get() in rproc_alloc().
> 
> I suggest to improve the commit message.
> 
> * Can the information “field initialisation” be more helpful than “bug”
>   in the patch subject?

No objection, though I personally would have spelled it
differently :)

> * Will the tag “Fixes” become relevant?

This bug was present when this code was first added.
Fixes: b5ab5e24e960 ("remoteproc: maintain a generic child device for each rproc")

Mathiew, feel free to add that.

					-Alex


> Regards,
> Markus
> 
