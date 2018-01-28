Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Sat, 27 Jan 2018 22:59:31 -0600
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 3/4] soc: qcom: mdt-loader: Return relocation base
Message-ID: <20180128045931.GA30392@hector.attlocal.net>
References: <20180106000420.10070-1-bjorn.andersson@linaro.org>
 <20180106000420.10070-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180106000420.10070-4-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jan 05, 2018 at 04:04:19PM -0800, Bjorn Andersson wrote:
> In order to implement support for grabbing core dumps in remoteproc it's
> necessary to know the relocated base of the image, as the offsets from
> the virtual memory base might not be based on the physical address.
> 
> Return the adjusted physical base address to the caller.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This looks fine.

Acked-by: Andy Gross <andy.gross@linaro.org>
