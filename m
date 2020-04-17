Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 17 Apr 2020 14:58:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [v2 5/7] remoteproc: Restructure firmware name allocation
Message-ID: <20200417205851.GA10372@xps15>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
 <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
 <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Markus,

On Fri, Apr 17, 2020 at 05:48:49PM +0200, Markus Elfring wrote:
> >>     p = firmware ? kstrdup_const(…) : kasprintf(…);
> >
> > For simple assignments, I too prefer the ternary operator,
> 
> Thanks for your feedback.
> 
> 
> > but in this case, I think it is better to leave the current code as is.
> 
> Would you like to consider the use of the function “kvasprintf_const”
> according to your review comment for the update step “[PATCH v2 4/7] remoteproc:
> Use kstrdup_const() rather than kstrup()”?
> 

Looking at the implementation of kvasprintf_const(), using it here wouldn't give
us anything.  Indeed allocation of duplicate memory is avoided only if the
string is pre determined of if it is exactly %s, which isn't the case here.
Otherwise things default to kvasprintf().

Thanks,
Mathieu 

> Regards,
> Markus
