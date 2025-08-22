Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3B2E54A8
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854585; cv=none; b=avnUFXme1pr2a0IN7N7Ozu2nMpiDz0GMffdaU0tqioeQdvCtrJfKTYcHy/VgeuQtVqBPGSLsZ7Hk6OEtpImdXvpnMUqpbmTeCFHCNnUiVUNHvAHx4pG0g+oSD3OX4/NmXPgS5CpweuPXbiFSWZf+Eq0QYdVT+v5pIXS+pxDGxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854585; c=relaxed/simple;
	bh=A81kBoegl40q6quwOX0WX4yiOUHqnmUUvR3iJOA0a2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHK5+zhb2F66AoY4AlN7gY2yk3crM/uT/KdTDgVKJ9vc0aFUPqTts3sgedndAd+5SUtz0VR0xDESZgl9eOCvMpDFvNIiLphHAd5I3/G+G7Q2ZQcx5C/7Uw3eemjieupIc+P03HPQYkncSGDpdNQYOY6v+XC0rifrGqopD6Ldlf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yramlMjx; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yramlMjx"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-33652937874so3710881fa.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854581; x=1756459381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=yramlMjxo2HVLHr77caITJqmao78DQi+W03uRRGABVDoijpNsUeuSCdK1TmpiJ0hXi
         GdZ4vJX75/t4Q+Q9Da1aUSKfT/UUVQNzpkZVqBZd7/uWx4WotQs1xPHzUoD63hJlWajX
         VAj/Pdcsg4mCr3WWO+WVte+c9XTUg0bzLml3DfEek7dleo4tySjsDb9Wpf0pDxppHiIX
         cqiFdOvgyAqqOqrmV9U0qKwyk7iEiojvSM0EvAc8MvwykNTPCwxI3uYvlKRc6SgiCz4s
         AnguQxajQDLQ1IS+mXISkUlGcJXvmR9W+RpSLjxoi6fb6rmdb9bnmctZozyEhIt65U28
         HiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854581; x=1756459381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=EtPFqkwAvY4/pAUkKj/XiOKBoUSALaFaHhrlgJHhhSE+FYtl2RxGDvHFGTqhl79MAR
         zE+DjrYt2chsz1PZP0DaYMcgc+yjj24Td7riQvAdZN2+lTpNRwXSg1+mfCFu8nGYp8kO
         bxYEnOZ+wl7refDLBSelUWvLl1kMq+UaNgx3xjZEmE4sxejB7dm0iPPpQ8krKTwTpS8G
         MEbnEUCatLnn/4Zy1EvQO1h+CtFyOjAQY41cKwngjQmdkNZ5TFsn3uAkQwO7jq3zM3N+
         v1Q2wA/F9Oxs/0I17HJD0bUjX5F0KfNhbZvHU9yVCulpuRdBfu6PRfkJxUC3SkYR0fek
         d+nA==
X-Forwarded-Encrypted: i=1; AJvYcCXTcF/3abGkRO550jS/IZBUDvcckBko7YB2Nwde1DNtLW7jA5580VJUdqm+nb3zPbBmrPza+JvcOTLGT8mqGIzC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26I4bDXmQIyAuq280XxuA950g3NfBsIyRn/gWvTiVVJx5O2te
	BJvem7WDQlnX3aQLPutPIb1JGOyi0pWW3J1yrqnabPtLRVpU587nvezWc7Mbepdi6VRaUv+fIpI
	kvU6bnSBdm0RcWTj1sVude3W9GzJNrBenA0Ix1v5RsA==
X-Gm-Gg: ASbGnctFb8orCjDS9ntiZG38/FRqvsxcJr0c8BTDXjB04etFXyKJ6bYSZn9uoz6Z+5L
	SVcnXCKbuurvro/UaZwaK5/1PLRRHFHAr5BsPvhIjWIZsBVfri18tTfUKdL7uA79gj+n9ynUErJ
	vtf5XwJFxf4t23OcgXjlm/AaDdagyeMKXi96auAGDgD5qlOKN4H71/ezTgztOjBlr+JEHWRtrJ9
	QbJfKvvrSmL4j2ZWw==
X-Google-Smtp-Source: AGHT+IGmS+5jZRiY3M87jYqtd1N1nFCNBKn5R2TEdrmd3+xxfd4PG/kXNNSVVgmhRVuloDKPRDouFdqjsq+r/vvoIgA=
X-Received: by 2002:a2e:8a86:0:b0:32b:5272:38eb with SMTP id
 38308e7fff4ca-33651002d61mr7071001fa.40.1755854580887; Fri, 22 Aug 2025
 02:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 11:22:49 +0200
X-Gm-Features: Ac12FXwu_A2fq6cbJB5U4ofkj6w0TKETQ4RpzZE3LHHotvIJu8LJQDJ8_-1dTpA
Message-ID: <CACRpkdbLKXx7GEOPemFGSTFy8oDG99TUFwC7sH7xkaoqe-cY8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own directory
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tim Harvey <tharvey@gateworks.com>, 
	Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Mathew McBride <matt@traverse.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 9:57=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Move ChromeOS Embedded Controller, Gateworks System Controller and
> Kontron sl28cpld Board Management Controller to new subdirectory
> "embedded-controller" matching their purpose.  MFD is coming from Linux
> and does not really fit the actual purpose of this hardware.
>
> Rename Gateworks GSC filename to match compatible, as preferred for
> bindings.

Maybe add some definition of what we mean with "embedded controller"?

Something like:

"An embedded controller is a discrete component that contains a
microcontroller (i.e. a small CPU running a small firmware without
operating system) mounted into a larger computer system running
a fully fledged operating system that needs to utilize the embedded
controller as part of its operation."

> Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Overall this looks reasonable:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
