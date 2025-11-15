Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60622741C9
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Nov 2025 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763228341; cv=none; b=Z35/4OZBgYztI5rWl/gmXMRuRKRybmm94XU7sSgCFFE4m14R6apwdry66LxkCPultW4Npxl3zQ5Cmsx8Zc9u48RDvNp8cxs3SaGEe9dXgHsXR5hupCi1vABBQa3TJuzxK0WEx/c5rz7jO9FmtLBgzhppGl57fZOQG5rFF0dsqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763228341; c=relaxed/simple;
	bh=axvrkSihge+9xhZ3hi0gwKyRsZ8ybhR3qmGzKH/27vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6WXMhbBwAhR0hxWYfscvsaJ9TLy4BzVnzzlKk2DzhBXl7F6CFqyAlG/F6fRjfpHi5aXPDa0FaALHip52+zf8X2uEEAhbyYX9Vb/n+hzXstXxUvWfP7tlV9KVNL4cuSpFsBrCjTaVfW2jcnlDFi3URjoxoTj9Eh3zB1Davi/Fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mksVvVqM; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mksVvVqM"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65363319bacso1291084eaf.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Nov 2025 09:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763228339; x=1763833139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVxVgAq914Gt36D2ho02AzcgyqfIBMKXorcNmzkpDrg=;
        b=mksVvVqMfgLoAhWD4BcX5+mPKKsKHVsVunRRmJjFLSdHeBT1AipP6CGPvd+2GNz45r
         ywMlBN87x5Nl8F/tDG4AtpkLIu/EWrdHU684yYZ7W13EsZWzlqldvY7Y6K35BrdiTOk7
         INVaMsQLUF/QJYY9qwMUw2moCJ9MbNv/eK25LHBUcrc7legxCHavyEfYKnp0+n3je42t
         4P2Xk9w/aMMq41x1Lg4PUPhTYmBp5/g2LrTRhnjUp4C+vFqX2Rw5dbJ2LlG3qd/j+KBJ
         bKP8rB3stzBxMAO6Ss3hGbaiNknlg8GIHOmEApO/WW4VaERdGzFU46Vg3C1bPikrFqvc
         1uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763228339; x=1763833139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVxVgAq914Gt36D2ho02AzcgyqfIBMKXorcNmzkpDrg=;
        b=wdRUcqFuw+3a+2UWw035MlM5kPGb43rPjmz4pRTvvjgDiKkdozjQcz5VSbjv9i1p0t
         eYV5NeeXft9YVr0GkUc+Z6JztGPT47VPUlBO+XriC+Dp259ikC7bCTddV64c7W9yl/CE
         IK3m/akispXCa0H/dBuaL14HUpqhxGBbt+0WgGKvD7tKPv8QM4sIbsw0PaBXmx2Q3Uqs
         158UD2qIY84yyYlQG7aYM5Gs7HUP1ZujZ/jpOwr53yNyygp+MYgCsHkVPoNry6iqC1Fv
         ydskFTYDwdmzTuJ9tPa/XK4F7tG3/iWYPcviFgAxBCClF2TopR+KcpysmxNiLI9a1BI/
         iHzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjdD8dO2cClUDeiyBTRmKYGNnvpIHrFdCIlu+621OoyHPKOCPIdA03PEOSSEFW1wjksElGN0NNeGx9d3gLv0SG@vger.kernel.org
X-Gm-Message-State: AOJu0YyEO1QV51ArzzOFQxvJ4CGP9BP1eYKAAp7TSqPtJPfZT0AwMcTJ
	kwFrUr83PP5YNVn2dIVfXtOK8FlS6h7bSSC3ur0aVmeS3+OdRxoRH6oG0iutVs5+Dz64ZzPadQr
	CV2vFiMk030FPpzcMRGZwowl+/6DtlIA=
X-Gm-Gg: ASbGnctdG715zekdEjsC/ueCOcEFeVBAuYfE+N46zz/mJe1qgH8HbkUu7brgFy8HoQJ
	HtRVGq5bsJX4xzqSSj5x5MXGMvC5TfYe9KoQoJoCINgMyqWL9zIF1r/EBrqZj3knpryn16ZePMV
	B+V5BGsW3KERhx3Td2Ax8ixi3K2PP9QLO3oWJWcA2cdUbbu8wbaH69Ylragp9Y9AhEbl9JEFnry
	2IdbtxD6Rtm0yjXt6mVeRn3uv5oj0nxUrJcFpVtULY+N8jUzPo/IQdyDFmN6A==
X-Google-Smtp-Source: AGHT+IF2GUyh2XS7BTBIW3VrwY8A4rsZLvmsmmJJOK/YALB+UYJp1tMWPljrfLfC5ozfAgG9hDdN3phFxSlFOLHWoTE=
X-Received: by 2002:a05:6870:fb94:b0:3d4:3:6548 with SMTP id
 586e51a60fabf-3e869165096mr3875079fac.45.1763228338736; Sat, 15 Nov 2025
 09:38:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007151828.1527105-1-tanmay.shah@amd.com> <20251007151828.1527105-2-tanmay.shah@amd.com>
 <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
 <aa1ff206-d505-433b-9715-56d866a5f675@amd.com> <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
In-Reply-To: <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 15 Nov 2025 11:38:47 -0600
X-Gm-Features: AWmQ_bmUrDcYvzE1II2zPNI0yovnvdPW_QMnBEIq8UGHnfzcnS-CPnSPxp9L-l4
Message-ID: <CABb+yY1Y90S_dbybMT07PTvmy60W2mt3mHdP56sp6DO75bpuNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 10:27=E2=80=AFAM Tanmay Shah <tanmay.shah@amd.com> =
wrote:
> >>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> >>> index 5cd8ae222073..c2e187aa5d22 100644
> >>> --- a/drivers/mailbox/mailbox.c
> >>> +++ b/drivers/mailbox/mailbox.c
> >>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void
> >>> *mssg)
> >>>          idx =3D chan->msg_free;
> >>>          chan->msg_data[idx] =3D mssg;
> >>>          chan->msg_count++;
> >>> +       chan->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN - chan->msg_count);
> >>>
> >>>          if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> >>>                  chan->msg_free =3D 0;
> >>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
> >>>                  if (!err) {
> >>>                          chan->active_req =3D data;
> >>>                          chan->msg_count--;
> >>> +                       chan->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN -
> >>> chan->msg_count);
> >>>
> >> No, I had suggested adding this info in client structure.
> >> There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
> >> The client needs this info but can/should not access the chan internal=
s.
> >>
> >
> > Hi Jassi,
> >
> > If I move msg_slot_ro to mbox_client that means, each channel needs its
> > own client structure. But it is possible to map single client to
> > multiple channels.
> >
> > How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this
> > field should be used only for "tx" channel.
> >
> > Or is it must to map unique client data structure to each channel? If
> > so, can I update mbox_client structure documentation ?
> >
>
> Hi Jassi,
>
> I looked into this further. Looks like it's not possible to introduce
> msg_slot_ro in the client data structure as of today. Because multiple
> drivers are sharing same client for "tx" and "rx" both channels.
> [references: 1, 2, 3]
>
> so, msg_slot_ro won't be calculated correctly I believe.
>
I don't see it. Can you please explain how the calculated value could be wr=
ong?

thnx
-jassi
