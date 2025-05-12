Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ADF1E2607
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 May 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058977; cv=none; b=lu2cQ/ccyZGHqm7D0wKhifal4/DMVJVRRu+gUH44M+IgWMRf3RGkHfKB82EI4v+QKTp+KWbwE/M6vv01gkTcCxLghOgzskZhpcRUNxpOsa0JfezLwDzKKUsRopTh9TBNGEqatk1Kfbr04Xddqjrut15gBwLrJ4Agud5eJxjR4vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058977; c=relaxed/simple;
	bh=7XK6JgY+Zequf1Eb4RpAPe8+LKRbtcIi0eB/IHQ1drg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AyQw/5xJSi2HHfRyLFTOgY0wsYHGfC8tigbjAauqYXDk5eh/B1CEhMd9y1TmM9afR5hRRaRCN3dpul3e3wobYYpi3LjHqcnu2n2TswM/KVjlu/BBRnoOWN2K8oeFi0QfDXfQv6Kw+IWrw5zPV4Yj5gojjmRV04C4NsNXf5jfRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E5zlS4zM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E5zlS4zM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace333d5f7bso836489366b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 May 2025 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1747058973; x=1747663773; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ/6iwA8CFKOFslZ2GtB9HB/9Djjjmbe1UGAQxtuVQM=;
        b=E5zlS4zMguMnX7vsb8aY8y3rUkkCylnbY2uJpBnMn2gSeV869PE2nrRNMWWFqQOTM+
         sdkQNeoMPxY8BkBhYetZESAIKhCEWiNEswzd4jmYxlFdvt0gh/N1wg+V8TBo/41P/dF4
         nTaNLl+po51P27BBhUUEYwDOycAqK+tGHOvPFntJnbiHuExUZtWdyjmsdyzBRfN0ppJe
         3xQagvaRt/VPiRbaidbCF6lIp007xMQXWoA54TKrUqtaWe/luRj10mgSYvCkMmqkF/tp
         TytK/99TzU3wy4arRDMmuEHk3ogLsb+bskyIhIi9gQMJGVfYbjDmE/F0UNXGExCq5CXq
         8DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058973; x=1747663773;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dZ/6iwA8CFKOFslZ2GtB9HB/9Djjjmbe1UGAQxtuVQM=;
        b=Zp44buwonQj2/Cmy0EbdatZOeew4pY11GVON9xOMspEizCRAtlwbV+vsHbHlP8hcYj
         wYMsrBcXUljIbf6jfmnL52a1L6bKqjqHh/EPZPar6Tz/MAwigQ7SxamlFPMCYqB9fDXY
         PSffK5Iqb0Mllde88X6TjJQ4HL2MtzGUTYxVTaNI57OM2G0CqiLD78L5X465vdeNzVLB
         ytzkRB5woW7zKy6WvTXQkH1o9jq2RlqVnJ7m30G4da792l/ZGW9xgoSxvLezH7th+34G
         JtpnRwTPswSRAXtw70sZAPdfOm/GNWuW7coZi1l3yayCn+w2hcq/027N36ocFFY9wFNs
         OlTg==
X-Forwarded-Encrypted: i=1; AJvYcCUmgGW8RXfQgYoFGaAWUQq/cCbnevUvyYGTKxxhMlXdIUXOWQxd7IDk2OEYIA/xIY+yfqPUg2rKSa6kSVJp4lGc@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFDKQJHBhYO2tu6qUKu92wmgvH+lMK7TGs6aEsBAKa6CnR41M
	gNmqzLI6GMTL/ajUHx2p4xQ++tBCdn/J9Ha8AHuuUUJS7NPG4WIOXBzVf+x5Ly4=
X-Gm-Gg: ASbGncuYCN4AmhizzRxwQhfqobvynFzQd3GIfXgPKH+ZsEqIsN459bdIYTqlk3mPbfF
	TgPw9T7ZeiPAiPmSf2BFWAlLv4ie0iK1LYLzDTILZgM4UrJazzffVh4dkGX/MBWoSf/jsUMT6Y8
	6rXYHtCYe7ixV7XS0DttDy3K8K7/yBBue5ZNB5hRBIw3iYUMGOHc7B+iLiEnRTMkuJTP1ZOkvAa
	4Gu2vt1ZHSenbYSXPz4AoPP0KY0rmbt0F7r/FY/FuXcIKyW0mA61QV/8jkXOxblXtMCeXccV9tL
	vTxO1Vmlgsv6onIYDtT11IdBmR/IPDAQh6eUYKWTn7OQtJFVidxb
X-Google-Smtp-Source: AGHT+IGG5FZn2sqQPs5HV5Ni5h1EziV7iYxDUiiwAQm72o77onMUWKhqMQJHb2DHtLorhV7URjJsDw==
X-Received: by 2002:a17:906:630f:b0:ad2:49df:4446 with SMTP id a640c23a62f3a-ad249df4ac7mr391806966b.60.1747058973286;
        Mon, 12 May 2025 07:09:33 -0700 (PDT)
Received: from localhost ([41.66.98.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad249c66fdasm278196766b.114.2025.05.12.07.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 15:09:30 +0100
Message-Id: <D9U8PV79LTVH.38UZBFZD2VB3R@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Luca Weiss" <luca@lucaweiss.eu>,
 <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] remoteproc: qcom_wcnss: Fix on platforms without
 fallback regulators
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511234026.94735-1-matti.lehtimaki@gmail.com>
In-Reply-To: <20250511234026.94735-1-matti.lehtimaki@gmail.com>

On Mon May 12, 2025 at 12:40 AM WEST, Matti Lehtim=C3=A4ki wrote:
> Recent change to handle platforms with only single power domain broke
> pronto-v3 which requires power domains and doesn't have fallback voltage
> regulators in case power domains are missing. Add a check to verify
> the number of fallback voltage regulators before using the code which
> handles single power domain situation.

Thanks!

I've tested this on MSM8953/SDM632 Fairphone 3 which is broken on
v6.15-rc5 without this patch! I've also heard of MSM8909 being broken in
v6.15-rc, and msm8976 also uses qcom,pronto-v3-pil.

Hopefully this can still go into the remaining rc's so v6.15 final works.

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3

Regards
Luca

>
> Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only =
single power domain")
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wc=
nss.c
> index 775b056d795a..2c7e519a2254 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -456,7 +456,8 @@ static int wcnss_init_regulators(struct qcom_wcnss *w=
cnss,
>  	if (wcnss->num_pds) {
>  		info +=3D wcnss->num_pds;
>  		/* Handle single power domain case */
> -		num_vregs +=3D num_pd_vregs - wcnss->num_pds;
> +		if (wcnss->num_pds < num_pd_vregs)
> +			num_vregs +=3D num_pd_vregs - wcnss->num_pds;
>  	} else {
>  		num_vregs +=3D num_pd_vregs;
>  	}

