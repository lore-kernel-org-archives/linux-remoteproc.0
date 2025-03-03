Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26732215048
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Mar 2025 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017993; cv=none; b=COvE8rrQt3nZ6+dTOnfiddhNA3+KnmlaqEryUf8eb+PtKZk7gdnZiTRmRsaGO9hrOVtbEvWX5OXTHbUc3XntBIEmRZBLTBi4yaFcrtkfmy/P/OMX3VQGDD7hUNnrDJoqKAEUPOfKLfLJtb4IZYdI6hJUVRYkdYM8I3LfMPG4QUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017993; c=relaxed/simple;
	bh=hZYlpXVETe06K1nBKt0O//dLs36Ingxfx3u6rkwXgZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gq2rOSjqjqejs2Bxdffbp5USsgJBfEWiNJYskRbAAhuro8n42SZJA3vEnWZuZlF32OADl+UDa9YXH1AaUq2iaUkNhFVevIn73xlT3ZphkwIhDthhiXLT4MImzJgNCjh8LSl8kunFdz3pi/phgghqYcsuaJY36CzbN/xT0p8ztHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPR5rfzx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPR5rfzx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so5239820a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Mar 2025 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741017989; x=1741622789; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LVmKIQ/spsmvFWc8M8mgh+kLtDeJG/1kdSdrS8ZCX0=;
        b=RPR5rfzx8sQWUy2wXwW79QhnBwP1tnTu7gtW/lWMNbwJSWwFfxCONpc5Aa+83muHtH
         GZENF/pTEs+iw263JtpAU/rRHeN4yHiQB1JMfV+42vtAoXk9pzJ7zredh+l7b7ldgMrB
         3etB7i/ZFD8bVcg11pDsAiX/0LeDGagihuPQCsQ4gSWuHW0NSqyLwsjKEayVKRkMO0w4
         2fxHKecK8Hih/Q0fvWxzYRFKUZqwA7xYCXfNXLW5/wdn2cAspV+znE7uVyBozkPzE0DH
         FZVeLF/tmc+HYQKDWykeL2RYycTDs5hDlTh8Xdbt1r9pgQTVtIplXMigP5VfIYTne+yA
         fqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017989; x=1741622789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LVmKIQ/spsmvFWc8M8mgh+kLtDeJG/1kdSdrS8ZCX0=;
        b=UgmUpfLu0dleZCbN958mbpXGr0eJyQNbf9arvOtBO7pAwI9r+sI+x9xdFp3jq859dl
         eJ9M5rupoci0uLyJBsejey+kZthsMjQ10iyW9AmPecjum1qZThpA5fNZqbIyJMD0PL1G
         +t5fw9trV7CZrMcXt681jvGqOkr5oJ06ESlo4DRZYI2Wn7RxSZkoo8TJ1qMPiHVSHNvj
         CgF2P29vUVARujYbzmmNU0KQcjg7JBsU6xBPedqNJbAcMh/LzeXybSE6leAK5W343AHg
         kZcgAbTuop0mJsPAh+p9gn9aNvOoaV6JuCcApVsjwTbOCDQQWLEDs8Wkb9FrCrMmYkp6
         5kkw==
X-Forwarded-Encrypted: i=1; AJvYcCVdSVvyttIm8F7HdmOz2oVOnnqSz7fXo0PWWGC6f0kzQoKWMln5X0RRe2XnY3HJaRRZ689iestF3ZUbwy1W7eKe@vger.kernel.org
X-Gm-Message-State: AOJu0YxOzlnB6c7EdsGQ8dJ7aRYC01MlJ3RZGzIZrZ0xBKGk9MxayJJJ
	CMxMCJpgiRFOEw+VQ7GvaMy79HxyGYt20d0xaT/xhmU9HOV+wyTpTNp0iOlVmtdmJyIFcpXU/Pk
	4U1lti2acgMpIy2fqc5kJyRNQH5v9SSk6Ujw34A==
X-Gm-Gg: ASbGncvmAWfvvFquIeVUAMjma0boshasAOO4ZE7DsXMz/dXjPdUSPIffUKOpyF23Hu7
	zF0Rhj50OnYwTYknKJlaUyOnJg2XvZlRyR2UuxO1wW9TNPoE/JBuBYruh2E86mmU7/MwGFjwuT0
	g4busFNi4WIx8j1lJeEsIjGfBb/R6HEaVNQ+u8DOTQyRIskpvdr2KeoiaiO8Qx
X-Google-Smtp-Source: AGHT+IHf9LcwZG7T8ge+yRZJ38wgoaD8YRLwUO6/GkSS7ER9OQvwaaFlECeHUNArFmpoMbu9WNpIEyH2eTDo2RCwz3E=
X-Received: by 2002:a05:6402:4316:b0:5dc:9589:9f64 with SMTP id
 4fb4d7f45d1cf-5e4d6ad8c0dmr37660474a12.13.1741017988891; Mon, 03 Mar 2025
 08:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z8LKKXJ1DUwGow-E@fedora>
In-Reply-To: <Z8LKKXJ1DUwGow-E@fedora>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 3 Mar 2025 09:06:17 -0700
X-Gm-Features: AQ5f1JpiGOjz1eLJaVM2IIkX79hQ1iku9lh_rBtTr_WayfFdACIkDoohkm54hbs
Message-ID: <CANLsYkyS1Uwaj4i5qe65C-DEh-avAqrvC_uYxu1bV70iTjsY+Q@mail.gmail.com>
Subject: Re: Question regarding AMD Xilinx dt changes
To: Felix Kuhlmann <felix-kuhlmann@gmx.de>, "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Good morning,

On Sat, 1 Mar 2025 at 01:49, Felix Kuhlmann <felix-kuhlmann@gmx.de> wrote:
>
> Hello everybody,
>
> I have a question about the AMD Xilinx remoteproc driver.
> In the past, the remoteproc driver for Xilinx products weren't part of
> mainline. To use them, Xilinx required users to use their own fork,
> linux-xlnx.
>
> This tree contained the driver necessary for using remoteproc with the
> R5 cores on the Zynq-family of devices. I have managed to configure the
> device tree of my ZynqMP board so that the driver functions correctly.
>
> This is where the problem lies: I have recently updated the kernel
> version to 6.14, using mainline since Xilinx now follows a
> "mainline-only" approach. There, I have discovered that the interfaces
> inside the driver that get information from the device-tree have changed
> significantly. So much in fact, that I have to rewrite the remoteproc
> section of my device-tree.
>

That is expected.

> However, there is no updated documentation provided by Xilinx, and with
> their most recent documentation, it works on linux-xlnx 5.15, but not on
> 6.14 with the driver in its current form.
>

The driver itself is fairly simple and aligned with the other
remoteproc drivers.  Even without documentation, it should be
relatively easy to see what is expected from the DT.  The bindings [1]
are up to date and should also provide some guidance.

Mathieu

[1]. https://elixir.bootlin.com/linux/v6.13.5/source/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml

> Asking in the AMD help forum rarely yields any usable answer, that's why
> wanted to ask you if there is any information present that I have
> overlooked thus far.
>
> Looking at the entry under the "Documentation" folder also hasn't
> provided me with a satisfying answer, since the driver stopped at random
> parts during initialization.
>
> Thank you in advance and kind regards,
>
> Felix
>
