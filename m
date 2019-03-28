Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 28 Mar 2019 10:26:21 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: hwlock: update STM32 #hwlock-cells value
Message-ID: <20190328152621.GA1398@bogus>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
 <1552492237-28810-4-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552492237-28810-4-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 13 Mar 2019 16:50:34 +0100, Fabien Dessenne wrote:
> Use a value of 2, so users can share hwlocks.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
