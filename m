Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7C2206A7
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Sep 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580265; cv=none; b=Z3ZwI9gzpnxTnvAE/7pCNaWTroElYwg5xPLyap/QBrDxJqez/5PLUXB8MB4mV7a3ywv+lyDqs6vEvCTsxX8qgMeavl4O8s4Gx68sy0a4G6Iy2YlG9DBcAGcL3pkFx75YpalNKudq1b1eOGv4SZ/Kj6i4mfPk2FlgBRT73ct6I5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580265; c=relaxed/simple;
	bh=1K49ZJm2cjVDd4VuqrRdstuQEPhQ6l2n2BOtJAelo0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJCmRfXQnq9uxPXDBoqkwBpw1alH3n1hqJd2Pr9BscWyvUfR4A2JvYAM2gOwqcF1HV8nj9UJQyr5lB8+0+vLhh0e8p88m/pj4ds+jOkx1QOI/5Cw+/zr1t8v2+vfRHEWoYuIHRPRoHJSWp4Tl4mrv8+OQqL5/n2d0UfTEsdZzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XnUQwasN; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XnUQwasN"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8960d3a6c2fso240887241.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Sep 2025 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757580262; x=1758185062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=;
        b=XnUQwasNTu9+h4/n9MAE+OBV8h8PTAtVF3osot9KrsOdCstd94jvh4f78TWW6CMRy5
         +m5sZaWyDaZrWUnGZVru2wMVzWUQUN2J1ffBTqpv67TwMR0OYHY2JUV81zGWfP0HhVZr
         Q/vtkCI2tvEiADlalCunzLqT48G1FskLDKs/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580262; x=1758185062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=;
        b=dVa4lb4DLaM0oNs2jOhE+aaWKjxM+So6tqdzoFFj0Ri/RZO4RGoREqwUtjZzJXCKs2
         OwSn58w8YVDFMQ6acnS+P0nDt4kqkiXmqOjPD0+e0TgHs6/CtXc+yGgrYw/imNdU0Y2N
         yFFGNrhaI5Y8JHN3Tg/PUhGkcB8Yz2lgslDOvl/NbnJ8DTy5yxiirwdwZP1TEFFZe3zC
         PMrRGLQgBzczrF9FN76jqAt+5f/99EajcfFt+WtrGpZgJ8Own1oWIO6U6hIbUSWFrjLP
         qBFRbc9AP7xBBYEOYf/Tb8a4jM2iXiJYFdQQgiwDiLaTAgdkaEZpaerXO0X9W5nN/0Mu
         Sezg==
X-Forwarded-Encrypted: i=1; AJvYcCWDjY4oXVBmP0EFOvNH3czNBHtTlk1ue4O9ZKPymzgCCOePjCdaIN83Xi6v+VMnxAZsywHT9uXObgUtnlG8F8zq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZxjTFKhDzjygs0X5P7T50LubIKTrHMpiz/wntqZvIFx2pZGbl
	oyiwHp12SsSRQD/j2mm6F2o1azGhn8jZzWVEB/Fym7d+dPanwwN1yVOQTf5/PU+tEja1z+k45KC
	xHgU=
X-Gm-Gg: ASbGncvxTzNDROEcrt+lGY8AWcHENtnfEdGRKZfDJ5M0VfNlPDaWDNGre8N3jRc42A4
	MvuxG9SlnsgsAdOR2XbM84J440sZdOrprOU31XFrin8Cdr5QkJo2Z/yuDwNBMcp7Zwlwuqttdbe
	2lphzK6SwqaGNibDQ9I0Tcf+wxfCJr3qFy6w82Yi16Q4Ov6JeBHX3/m4Gl9kLVp7lRgu0QfVoju
	6v9wLh1oUh+bW/N3LgP4SQfzbry1mMWCPqfmT0A0m3SeH7090CCdghffB/Txi7EC3Hen7lKfcia
	rGusHuoqiVpgVicSKqm1HZE2jv9zb1iLgxigILIwfT3WlMDh+E7XqHMUxqjc/G3hhnD+OkK/rOE
	bVHPw9Lp4PN5Eh5bLU7PRmB0lSDM0VUVz9wukiGHXr4Sq9Z7S/tDrky/CjkxL9QylrbRV
X-Google-Smtp-Source: AGHT+IGuXEFP/xuyWS+8nRZQEbPsVddCzJhCnwEBc3OaTvahNoSiFs7mWuKPd0dQACYkzfycEI1tRw==
X-Received: by 2002:a05:6102:5983:b0:537:f1db:76b2 with SMTP id ada2fe7eead31-55209add315mr1033365137.15.1757580262518;
        Thu, 11 Sep 2025 01:44:22 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5537062c9c5sm217438137.5.2025.09.11.01.44.21
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:44:21 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8960a3fb405so1222093241.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Sep 2025 01:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQb31LmYOhNSgjjkCBwp3WwFKR80lSNQfuGUxrkI5JzleBF9vVDQyv6WDFGKURfOOciaj2BbWVXNvHYwi0TFIg@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:4e2:a235:24d1 with SMTP id
 ada2fe7eead31-552065728bcmr950644137.4.1757580261120; Thu, 11 Sep 2025
 01:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908044348.2402981-1-fshao@chromium.org> <20250910115508.0000785e@huawei.com>
In-Reply-To: <20250910115508.0000785e@huawei.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 11 Sep 2025 16:43:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhDRQFVBDydTq=fmC=jz8e941aPwzg+cY1ZQDqWppx+fQ@mail.gmail.com>
X-Gm-Features: AS18NWDats_rTOk_H5DcYgtjHSlZm8cS5lY_RPdvAh5_wYx68w1LGLEaew8wQCg
Message-ID: <CAC=S1nhDRQFVBDydTq=fmC=jz8e941aPwzg+cY1ZQDqWppx+fQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Use for_each_available_child_of_node_scoped()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 6:55=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon,  8 Sep 2025 12:43:25 +0800
> Fei Shao <fshao@chromium.org> wrote:
>
> > Use scoped for_each_available_child_of_node_scoped() to remove manual
> > of_node_put() calls from early returns.
>
> There aren't any early returns here.
>
> This runs into some of the stuff that cleanup.h docs suggest we shouldn't
> do which is combining gotos and __free() magic.
> I think this case is actually fine despite that but in general worth
> thinking about the code structure and whether that can be avoided.
>
> One option would be to factor out the loop into another function then use
> and error return from that to call the stuff under the init_free label.

Fair point, I can send a v2 with that.

Thanks,
Fei

>
> Jonathan
>
