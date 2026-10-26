Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000975;
	b=4RLp43w2UgvBb5M3GuGubbGAXQBac/y8bNUVFFSdDPCl0XRZ6ILrXlr3dvjxf6iSCGUM
	 Fu3+tPZPtVQvxp13hD8II/mBe5ZLWCztx41rwMCGUJ5A3W8g59agCeFnw7TI9o7Ghygt9
	 sXyej1RpoElRFktNC3imEPo/p/FMyoH1J6G/5qcXcy7dJWG/NGsp5e0VMMIIkrZwYcVgF
	 uzKfRvpfxfeJljBv1B8xKZHbZAfVZi8rg6pAQn3ArniXQ2H67mMu7HMZLj7WTjqpXEE1C
	 J8FtaLvujxsjCM0FcuJFL5xP/VmukZg9zkvjvyGJhSN265kaaKOkhgX22FwpuGoqT9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tGan54VoAnB4BE1bGQWN3/UB0AMHIKWY02TwZZSb8dc=;
	b=qktF/K4PEZEinCl81PXVTxKVVIYj3WRro9LnxnQTE/WWMWduIxLbHAg/2xnA9uvN9xjM
	 2B6a9Fk4sUmClln0NF03QtmWK4lUfNyBLAsw7M0sH8uPcrzMYksFxCPkodgsAxOksBafL
	 2CK27Ej+c7wc2lmH4FDGSrnqrPxzAPyclrahZEAl7cbuE4dyl84XuZmtmHAVTUaUC44Dn
	 kNvktvogqFRttJQS9wwC0yCpAeVe3N9iZ5mDSUGGVRT9ZjEBsFE86oCU44u19fZrCp+kG
	 I8SpMGmgE1cgXYlzufvyznrCy1mC6jiEXqnwp/U4Nc/7oCi/Or/A+9TkXjOGYK1AnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Djp6KgM/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935F8606A31A;
	Mon, 26 Oct 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Djp6KgM/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CF11F01825;
	Mon, 26 Oct 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793000975;
	bh=tGan54VoAnB4BE1bGQWN3/UB0AMHIKWY02TwZZSb8dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Djp6KgM/ed2JB1GYRGErLaSBWyk2umqHkL8Qd/t3iZ3KIQyMH6wf/SZcOl/F2nvnm
	 J08z3u6soNcscjlSljFsrWs6jyqderjJuFXv/LlciGkUiS9YEcnwijYS5Py3Q9pAwu
	 5bzhC5Ss5o53wBcVQrBHXM+T/1fFyG6FzDtDj8up7fgb9EzaTeYsGguzFoWm3A5Mdz
	 kQcxdWEhC+PHL5MtK8b5dR/4RhmmD/3Bfil48gkj2uelsLrQDnV57mcsLKCJGorOM0
	 Q2hbssBt6WxooFcoe9hM9jjebnDbKqSAs8zh4kX5GjMY1LopHj+IACG3uZoTLwjQLC
	 n/FTqA94ydnpQ==
Date: Mon, 26 Oct 2026 08:49:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu.vizoso@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
	Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
	Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Robert Nelson <robertcnelson@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Markus Elfring <Markus.Elfring@web.de>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Suman Anna <s-anna@ti.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-remoteproc@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
Message-ID: <20261026-illegal-gifted-rooster-047a1a@quoll>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>

On Fri, Oct 23, 2026 at 08:39:27AM +0200, Tomeu Vizoso wrote:
> Allow specifying a second sub-mailbox that could be used by the firmware
> in addition to the first one, which is taken by remoteproc.
> 
> This is required by firmware that doesn't use rpmsg for their
> communication with the Linux kernel.
> 
> Assisted-by: LLM

Drop

> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

DCO mismatch.

> 
> ---
> 
> v3:
> - Initial version
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index 278b88b7f906..d6319c8e96f8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -51,10 +51,12 @@ properties:
>  
>    mboxes:
>      description: |
> -      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
> -      communication with the remote processor. This property should match
> -      with the sub-mailbox node used in the firmware image.
> -    maxItems: 1
> +      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
> +      communication with the remote processor. The first is the one the
> +      remoteproc core uses and should match the sub-mailbox node used in the
> +      firmware image. The second is optional.

Instead list the items with description and minItems: 1. Don't repeat
constraints in free form text.

> +    minItems: 1

Best regards,
Krzysztof

