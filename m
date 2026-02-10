Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F723AB98
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683952; cv=pass; b=rsLZ007GrhHsRNjAgvUVwel6E37FDpK/RvcORDPo9B+Lsz/tuERVPD5jULiRQPefbDq1tgIpKVmyaGcl43DwiqwEglAQa7M7LEiKNFL2F96GduYU3WAZj9iFSVhdIITe7ocTf78jco5/KQGjaUSJaDskfkb7vrz53qxrvA09Drs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683952; c=relaxed/simple;
	bh=CRHDCY+aNL8cCuJ5x1LKl4BcDxts38ZAFNhckqdTfRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg8SOYv9Q1TjOTUynb/3FYBagk+IzG8IrcJh4PeZamNg2FMnhYKjJvB0sO2Ia/+ErDT3I0DcOYJ/VEXA7zNxjSVqqu8w8xwNwBPZKqKk1bvjxumLElsJJuHPpzNit+ABipRP6VGZkA9KXIcSZkMgbBiOAkMii1RVKMcbZJbsk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCSuMGfE; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCSuMGfE"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67263e2ed52so425447eaf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Feb 2026 16:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770683949; cv=none;
        d=google.com; s=arc-20240605;
        b=jQuK81vagWhzZ564VNTO4//ASf13PkDENhIvKey9TMqzwUoErCzcCi4MOmP+YKKSpj
         UbMj9DyDHlG60yr1dz5lHT7+zgtElE8KJ9eVaApau8q1fATSPNWw0Lh88Iq5YBwVvNZF
         eu5Y7+5RBIHnxA8JOrWouIyKKANK5jKTbGmJL+6cHnb0wTMUcLCREO71yC1xAn8bhgCL
         sNy6zkOdK5TRI8CjxvrdatIA0Ia6Qu9vArKqN70xyxKuykM6FkflzTOwraOCD/Hhr6QR
         Iv0+gzUSESpDB60aBaFoDAJVBWhnrWQ0oym/oysm3yQNWNFimCF2+esk2LPHbMSY6/1T
         xjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        fh=efikkLjuzVxFNTOM4XeuLg4T21S3j36iHpZ3+WchxdA=;
        b=fOBvkAkJ2TNhDFaDm2j2dFZnUDyElSbC8zd1BWTflclT8KY66RJZ/77ary5hD0Hw4+
         ydE9hJcEyVnV6L7KG2MgnU4fyyPTfla+FYKNTII53FnBhpwIJ3HUBEjAquFr6bIlRUCo
         ++rY9Ya5Q9JY3Y3PF1sEt+gx7eGkZ0mF7kHYlVbTkVBhFNecCe5kzpdF5coZpO+2UH5c
         kjFmaAE8kGbr015ig/7nre4i7guow+PZIH/s0ZSCgyYvtKmzc8jiDbX0wKuqd1rk34CO
         pf//RaG6wodKXAw6yLUq40wF7iRl1OQBGks1xShFiDLDLjrJmy5kXVZwBxsol7DT4ueh
         KQIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770683949; x=1771288749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=GCSuMGfEPfzMl3he42tzkuKrehHOEwSPbWg9z90dF81Afyi3sPX6nHguyl9DXmTk4e
         6I4gIyihsEb7ZViL/AxrsB3qEzoyeA18VCG/n5Dy7EsyjJHpAxbKkbv5kouxorw9CtSY
         ErTcKZAIcy3Ck62Eg3V5O21E360Cg5+rXaqKmHKe3Ecv1aNdGvtcCfyNZzVJEEddoNDv
         JRtyUaMb9DMW2gKJjKDCu2T3OnxM4xcAEhRlVGVsVu+/IUJ3+AUuriZmgpVGoIg8stGp
         PfG5iXK6qZQFyuDRY7Qx0LItXki1cH4fE3AjOoiegYwEYQywG2RTCdmaOzOAFkzmXgzb
         Zlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683949; x=1771288749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=Rq46w9Csa8PCGNKv42F9lYRA+Jm1ul5DN5Z7WjzUfqgLAjmn1pqOUUZXY1VZF9Xq9E
         /dQXgM2BU4u3EDAFCCinF9yLKZCsTDpf16bA/iVnpCfFbK24z1Q+xt8+Nk065KcUURWo
         fkqzU8WSQaqhjkajjmBAFMGEj21CCApU2hK4oPOf4G7EwKbfORq4auw/bdggi1XLRhQL
         FYc+QGaFXVso1Sh/TZV8V3MA+DRXP5OYSP0W4K2dosHdlbHZghW2Llgv5+zfOAMIFTu6
         pdotHwL2qBBN14OZ4uMFtF260xGgqiIGP6tCGZEbaoNepTg1R7WMZ3i96yEe45+W46GX
         P6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCURVrCNdIOC3JcAGvCOFXYc8PVgP7mzqrU442RB/v3aoWrW4SdL2z2UJQIZnc5KOlE147b+7MlTuCVL5Es5kg2i@vger.kernel.org
X-Gm-Message-State: AOJu0YxE618rcuzs6gj2rcCo8FD0mYbnXOsgMeG3Y/OyKU98r1ex6ljt
	Iss1LJUiPLrppXxHqLK63oUY2FuGhR8jB0Av2Ybj4MAEWlTW7m9X3iTIjbtHkWDhxraRQ/kctvU
	EFw2gAcLGTKMISHvuXbXEwEqeFpyTgyM=
X-Gm-Gg: AZuq6aKotGKf8F2Jx3O65eTTDqPje5S17nqpeHn9aVOe83ZFqmZAVCq7X60vY+dVfp7
	JeQE60kt+8LtEGmZxS5yk3SbllWXVhod8Jj0eC+h+kOZ6PNYvlL+LsY9FotK/pUP1r4AZFDz/fz
	ZeportT799BKBXePnBOcWEETUcjWOaidXAonIwW3JE9ZV1zHtTGzt08DRGPf1bFSoUcYs2MNn6k
	Tc41pA3HSD+9JR7yT/MVKiyf/UXZAD0O6BQY0QBl56LngxPn/I/iuipvmUHpb5SFuq9Z6llN1iA
	TKSjGhfr
X-Received: by 2002:a4a:e908:0:b0:65b:257b:a898 with SMTP id
 006d021491bc7-66d32fdac10mr3465078eaf.29.1770683949518; Mon, 09 Feb 2026
 16:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208040240.1971442-1-dianders@chromium.org> <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 18:38:58 -0600
X-Gm-Features: AZwV_QhZe5s2jbJJnfFS4JALRsv_5-7Jio6ijB129QGrcufx887IYcSq_3ToyAU
Message-ID: <CABb+yY2GbPcuPiVsE_-HCS8MbpBqvjgjDkoVLNSBDZq1bnfpEw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Frank.Li@nxp.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Sat, Feb 7, 2026 at 10:04=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
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
> +                             "NULL mailbox messages are deprecated\n");
>
Nit: maybe  "NULL mailbox messages are deprecated, use
mbox_ring_doorbell instead" ?

Thanks,
Jassi
