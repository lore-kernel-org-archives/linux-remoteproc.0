Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477F399007
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113049; cv=pass; b=nsmsG2jyPSAF+oElfRzYWHyZc+4XnaKnh2calajIRhCL4t5ceFfkNU/TsexY76xVStGoRpv/tebsJN7iKU/D2xin9gjDq8hTJJxCvZThzn3ajHxhr7tvU+Y+TlnYDZM5/5baB9DLc2q/YSyipAghbFQ1zT9KOFwdBEU3bo/Nyeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113049; c=relaxed/simple;
	bh=Lcr5dVXyCC6NuA15tJ5l/HwAKYVsMmOxotK4MXcexts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPwXBvXLZymGrBFk2mZ+Y/7z9Cd2wJLgItBZYCU4Bh0nFV/FJzwXgSnxYUbTLKa+fkovWT6cq1K+x8FbwNIM+f45+unuReU7vw2IH6aLue/NKx6h3z7WJ6i1kUaw26XdhI3N1cTOGuSxWmSptzKPeMq01nc4aJlFg1+KJQ7Raa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBSWzME5; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBSWzME5"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-404254ffe8aso4766239fac.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773113046; cv=none;
        d=google.com; s=arc-20240605;
        b=LFG/nUAi+CY4YhJLlQTQ7oUUHafwjNl0ooWiHMMd4faJl6kpuNjnCNssqSL9QAc9xW
         kXcnpDVsayU8xs4/FG8XNdYSuoS/5FIawNol2iTNjv3cTEnAhUF2kH8hIrC0tFynOZbT
         myC5TBIURi1HZBEIv+U3FVd3EMirJRZ06Ojf/HhP98tdilxpKbCiD7U2vK2qdVX2Jd1T
         u2y0EuLQO8GEo0dYViJsuf+h776EGv9WEKwromriZmj0uNZoxmzNkGFxvaUrDXC5r1sr
         vJkrgmDFOJR7D+xQ5Z14UY0V3lel8ifvXjge67eiIWg+5YmpA/5XNQ2PBXHQQBV2J95Y
         xdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        fh=+QyN0LaXFgr3sQz1tbYUEPBqoRL7qZQmdr+eP/AWHfQ=;
        b=Nfwa/NH9/ESVeutv6qT7idTe5uPD4qXeG51bAIcDf0YbTYWOv35kh7EsWs7q/eNd7f
         rXySdKUnvcJh9gx20wbXeu6+IMdZhoXjkw4UsvxDkPYC1AdaUk2+gcEqki2yty8Cu5gD
         3oUS75q7/ixDcNqR0P2czlqZFpzeYNNslkElqqUHqg/MmMv7gC4U1S96W8eCGA2N1kQj
         d9hRnYPATzLB+xKj7VBiNkk/ls4KtZ7RgXqtsw2tLggzUWEGXzjZn6WFer3Wt400Zb1K
         9X5imZgriPdb+FavjKzcr6Hz6k4Alw1THBNDdDbXyCiFMMVOPo7qzGFWaKBWaFAJ7mJS
         yDxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113046; x=1773717846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=jBSWzME5mmDt+P73t+DCqn3BR9/LRYmvJLwD3COsdTW7jJAeGeMD7vWegQm0kO1jnb
         eposRxG/wfW+/sbnaM4TG9QD1wZBVQPsBzT0GUBOmLWmj7BVZmKAu41tyRm0eZ8d9dvE
         c4mknSfMgR6NUzyqe/8wJnqLpWmRshN7I9+LX0AHpop3O3zEvE9hH6cZL7XoGSlgfgx6
         aOlisPIL1Gnilx7ZE+GObnfzLuLz4q7C+gcPuOhjjwpMyHnX+Ns995kFh30BvgeonYDy
         SXhEHm9/ml0cG6yEFdQpyAmV4NOSrM1kvI2NFWmJN90zz54ahqvjYjMMbBVrl6CyqGq5
         4m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113046; x=1773717846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=kgaftJt3NV3a3GIFFUWAtQ72QnlT1gYLpmfIeY1PQ5GTfH+JryxYW6bCtJeUo3dX1Z
         1XRCrr8HR5UgvuH1lAkk8DOByKU9Cs+VoP3c0VKbZnuO9i9RAaHZdt+BhcqN3oNiqSTt
         1HsnnWrpcO+XXhDLoo63tNOu9ywE0uiMarcwP9mrgrtDU/wqE7ksDIGmrWgoqbd5uADx
         i5VbxuJ/rxnTFLagJw2/QWYoLuaEC9hf/BqNzY5jljv6IWH/WYXWpUx6RQcEH3QRvYIq
         3Hg5UTS3p7yEKH1jWLTTjc87u16onHpqIh5LzZPxEk4rjg/IGi1zcWpHgv3I4Z5KBKx4
         FqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9vJjO9oIPEaI5Gj+PwkpwJVzWcARm3nSkYydyAv3va4e+HhHW4Qtb08Ekw13NekTbTROcHxLkTrDL3UyWj6Jr@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfIqJ3g7/9SelZQCxQvEtYjcjONN7dMFv8gFkhimljHzkNtfs
	WBDe2M+rfhEUGd9i1xw5pAHBKYu1RoRrfnRQeBBG4wpLZbOUlSw5wnZgJdsZYYAYF1cFdfYUUOD
	6M5xozM1bbN1IxPyJvDqe231ypkmEkG0=
X-Gm-Gg: ATEYQzw4/o+7H+EdSMNdNqUzUzvAg1kHbUg+N90fueUgfnCGwo+RzM+9psFk+n/hmLv
	0tWwjvshEwTInMIAHI2FJmI1sQusPSlZi5MkpDcW+8N9JJ1GUZcclLVAYgrUTvQbFmdc9DFEybj
	FiCo5M8RRv36Im+lY+bKJJzCB8cTGFlX1BGZSBxmgrTF8pIrGvRETVXMWcZV7Vm7UTdU4YXKipA
	AK4KrRGo9VX956OggSEBy4VgJLNI18EHCfqnEQSveBtO0908oY7BCs1XF9MPwX+WNimOs2QySdh
	r7ofWNMD
X-Received: by 2002:a05:6870:a0b1:b0:416:42f9:8d86 with SMTP id
 586e51a60fabf-417568d4325mr1271236fac.10.1773113045873; Mon, 09 Mar 2026
 20:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org> <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Mar 2026 22:23:54 -0500
X-Gm-Features: AaiRm53275_H0CT6bFAmFiNzU5-bzNSMm5pKGBVqlCEoP2LLCsiLm-21V_J1GP8
Message-ID: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mbox messages are deprecated; use mbo=
x_ring_doorbell\n");
> +
Does this patchset leave some such clients out?  If not, should we
drop this block and return -EINVAL already?

Thanks,
Jassi
