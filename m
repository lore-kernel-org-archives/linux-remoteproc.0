Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Thu, 16 Feb 2017 18:37:49 -0600
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: mdt_loader: Use signed type for offset
Message-ID: <20170217003749.GB29050@hector.attlocal.net>
References: <20170215220041.3077-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170215220041.3077-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, David Brown <david.brown@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Feb 15, 2017 at 02:00:41PM -0800, Bjorn Andersson wrote:
> In the transition from using rproc_da_to_va(), the type of the load
> offset became unsigned. This causes the subsequent check to let negative
> values less than p_memsz + mem_size through and we write outside of the
> buffer.
> 
> Change the type back to a signed value to catch this.
> 
> Fixes: 7f0dd07a9b29 ("remoteproc: qcom: mdt_loader: Refactor MDT loader")
> Fixes: e7fd25226295 ("remoteproc: qcom: q6v5: Decouple driver from MDT loader")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Andy Gross <andy.gross@linaro.org>
