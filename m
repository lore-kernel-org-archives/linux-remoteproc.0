Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 9 Nov 2016 18:45:27 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/11] dt-binding: remoteproc: wcnss: Allow describing
 smd edge
Message-ID: <20161110004527.6pl45olmh3jyckxi@rob-hp-laptop>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
 <1476931212-1806-5-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476931212-1806-5-git-send-email-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Oct 19, 2016 at 07:40:05PM -0700, Bjorn Andersson wrote:
> Allow the associated smd edge to be described within the wcnss
> remoteproc node. This creates a bond between the remoteproc and the
> associated smd channels and devices, showing the interaction between the
> two parts and provides both a natural reference to the other.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.txt         | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
