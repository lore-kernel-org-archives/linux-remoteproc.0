Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8E146D42
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Jul 2024 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907167; cv=none; b=pY1iM+vy+C2DQTirH8XrD6eRkffl74wcQFh72g52Bsec5Ni6dbT8zeNqTyY+VZEUadfehIcPYhQFxVFI/I7Nz2e9YM49sSH/vZvGiz1TQBxzAsjWASqB0anGSJXhPyd4Ke+gu7h+QOu6wMYQFsF/eV7nFFzOa9QIxBhrxa85tqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907167; c=relaxed/simple;
	bh=xO4jgFcHGGtM3PtvZAzuNk3ui4TywDxw1FF2Di44KFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIazZD96E+3ypgEwvGdBgwcFMwZWkIhrG0itNdE/rOZTeRC/1EJ0u53K+gNSxasfezvdfqLRh4S+ROxfPRa72DqXSCaN82B4qQ9XBc9IrBpEbNtIc1i8k9u3I4++IxfOk8bfYX3zc8jwTePTPXEdqDMXDtGhiJbBvhpvfhPhops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nlDVsS9W; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nlDVsS9W"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so6278919e87.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jul 2024 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719907163; x=1720511963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpyvxQ8xbjmGUnixp39QhyA5GFx0SN+s+GmNtVx8+E0=;
        b=nlDVsS9WQkg8MQeV7oo59ZKzp7z2S1AkcllrYCvGu/tz8yqd1vKYNKItHDtMhsPPzw
         Q4+187fxnN+OmuzNyQXdmCdy/ExfcLntXwiKz5QB0GHNWWb7VUmjYYJo2n2If7OyGhVn
         YsKGwL0ZdDx2HCTpaAmMUddDRc6WemjGbRK0It4Xhdlq0YwqXpkTrnHo09qzbjllkqLI
         Egt1F3z1e2mjx/0IlyD6mYSZiiAkC+baPeRzBwjUtnr0HxGmD1REUWU1IJoi8rqYzXAj
         S+dHeZ9Yd34DBXHBFDaSSO0jko8RM4ZssC6ns6iRsPeqv43ZW0VtLbM1IaegU+cpd+r+
         oz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907163; x=1720511963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpyvxQ8xbjmGUnixp39QhyA5GFx0SN+s+GmNtVx8+E0=;
        b=vYN2p6HltXQJS22xCx+Ii1pbzYlKtYTePXFSpGDrqk5ZHCctvtHD3aKA6gCL2h3AAd
         +ibISlj4DwyfRE6rg+MtaMeoO3xn6YV+x2C/scOZMjYhJEXzN56b79+Fqi2C6uP7vuMp
         nx4QWSMHILueSBvo70ImmwtfppojxmxoGEmI/oO5ylDXwQ0FtRGbpQcWNLyP5WIZdazP
         A3PHk19m/y/2GvL0ZUpRA3/HHXBbRbun7kRhuoJ2SReIiRMZ0BJKvtdMs5otFe8y/9af
         jTNM+uBJ22MpGluCM/UGrKpSemIxE/Wyn8/o19ZE4yStjMwLvKGStSa9jHwwMZMyu4GE
         7CJg==
X-Forwarded-Encrypted: i=1; AJvYcCVSM3gVOrCRRwv/VnLpOIXx1o+2dCmXJ+v078Qr3yXp6BEOnXjTSuhlhJqvWe84dsj7DdEtTou1XDQbyUg3CjEM4b3autZxJvWtoTGg/YDXNA==
X-Gm-Message-State: AOJu0YzN9TOJmRxkwIPF5Vp6pHClZRB4DApmHfjZuEYcBNekKkpLV34v
	N8rpylz6JWyLrbSCXrCg8nU9AgWcZ+8qANOAiLI1EJjIF68HZy3zL3CDF6Eb850=
X-Google-Smtp-Source: AGHT+IFu60DTwWGR8MMLwXSmwkhC75Hs8TtEXLJtowjRn73LqZP6vLcd/4pHjJ3ShXg72GnfNAT4Pg==
X-Received: by 2002:a05:6512:3a91:b0:52c:dca7:c9bd with SMTP id 2adb3069b0e04-52e82687f28mr4318804e87.30.1719907163576;
        Tue, 02 Jul 2024 00:59:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2f8b5sm1710321e87.233.2024.07.02.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 00:59:23 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:59:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Cc: quic_bjorande@quicinc.com, andersson@kernel.org, quic_clew@quicinc.com, 
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, quic_deesin@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH V3 1/2] soc: qcom: smp2p: Use devname for interrupt
 descriptions
Message-ID: <nrqojhdkt3ay5mtj6fcpmzqlo6xjo6rkvwymm673nn2b3tqqxj@4cjlba7j4o3p>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
 <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>

On Thu, Jun 27, 2024 at 04:18:30PM GMT, Sudeepgoud Patil wrote:
> From: Chris Lew <quic_clew@quicinc.com>
> 
> When using /proc/interrupts to collect statistics on smp2p interrupt
> counts, it is hard to distinguish the different instances of smp2p from
> each other. For example to debug a processor boot issue, the ready and
> handover interrupts are checked for sanity to ensure the firmware
> reached a specific initialization stage.
> 
> Remove "smp2p" string from the irq request so that the irq will default
> to the device name. Add an .irq_print_chip() callback to print the irq
> chip name as the device name. These two changes allow for a unique name
> to be used in /proc/interrupts as shown below.
> 
> / # cat /proc/interrupts | grep smp2p
>  18:  ...      ipcc 196610 Edge      smp2p-adsp
>  20:  ...      ipcc 131074 Edge      smp2p-modem
> 170:  ...  smp2p-modem   1 Edge      q6v5 ready
> 178:  ...  smp2p-adsp   1 Edge      q6v5 ready
> 
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Your sign-off is missing. LGTM otherwise

> ---
>  drivers/soc/qcom/smp2p.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

> 

-- 
With best wishes
Dmitry
