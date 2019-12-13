Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 13 Dec 2019 17:40:42 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/5] dt-bindings: hwlock: Add Realtek RTD1195 SB2
Message-ID: <20191213234042.GA9835@bogus>
References: <20191202220535.6208-1-afaerber@suse.de>
 <20191202220535.6208-2-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191202220535.6208-2-afaerber@suse.de>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-realtek-soc@lists.infradead.org, Cheng-Yu Lee <cylee12@realtek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon,  2 Dec 2019 23:05:31 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Define a binding for Realtek RTD1195 SoC's SB2 hardware semaphore.
> 
> Signed-off-by: Andreas F�rber <afaerber@suse.de>
> ---
>  .../bindings/hwlock/realtek,rtd1195-sb2-sem.yaml   | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/realtek,rtd1195-sb2-sem.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
