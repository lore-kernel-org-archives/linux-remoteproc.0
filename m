Date: Mon, 4 Nov 2019 15:02:21 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/2] Support for MSM8998 mss
Message-ID: <20191104230219.GA5505@tuxbook-pro>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: agross@kernel.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 31 Oct 19:43 PDT 2019, Jeffrey Hugo wrote:

> Booting mss on MSM8998 is a critical step to getting wifi functional - a
> rather useful feature for the MSM8998 based laptops.
> 

Thanks, and thanks for the review Rob!

Applied,
Bjorn

> Jeffrey Hugo (2):
>   dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
>   remoteproc: qcom_q6v5_mss: Add support for MSM8998
> 
>  .../bindings/remoteproc/qcom,q6v5.txt         |  6 +++
>  drivers/remoteproc/qcom_q6v5_mss.c            | 52 ++++++++++++++++---
>  2 files changed, 52 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1
> 
