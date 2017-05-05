Return-Path: <sudeep.holla@arm.com>
Subject: Re: [PATCH v4 1/5] mailbox: Make startup and shutdown ops optional
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <566237d9-5b13-b51b-8cde-5d1890c2e217@arm.com>
Date: Fri, 5 May 2017 10:35:34 +0100
MIME-Version: 1.0
In-Reply-To: <20170504200539.27027-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.orgSudeepHollasudeep.holla@arm.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 04/05/17 21:05, Bjorn Andersson wrote:
> Some mailbox hardware doesn't have to perform any additional operations
> on startup of shutdown, so make these optional.
> 

Quite handy. I can you this to get rid of empty shutdown that I added in[1]

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

[1] https://lkml.org/lkml/2017/5/2/315
