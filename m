Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B5227EA7
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867127; cv=none; b=CBq2CTPU4fwyvONxazVeKSj9s4h+glqya+AUkGINCOQkBCf+dBNWhOtZGpp/4PGpH2Wzx3VedJMwn3ImZDuj2kKv2N20oU5fvKFDun5dYUX+WTVUczHHzjYu3ECn1FY3DxqCG6cin2dFt7fQcpi1gkZ8LEsrUnEiNbz1XUVpEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867127; c=relaxed/simple;
	bh=xYb0rDMNB5Kqj/n23Zh6oRZBeZ6LOsmWTGefleryl6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoZHGGBmCXy4tHAu5+XPiKJGSxjEA8qjndwCWYm2BKFwPsZP0+LMiTdIACSA69D2iC+NNFF0Kt/bVKTwPZg4VS53gC7g4lqKXAZdcm9978C+7ZnjSK3PgXC0IFQiYXkuOtWDIV3swrVvK6Rjr2lQpb3s890DqLQ0+k/PO9VHtyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J61NADb9; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J61NADb9"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7a76561c291so4126399a34.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 12:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759867124; x=1760471924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i+DaBHwLGUsHUY6K5jBAv25/GP5doDNsw2CwcVczb4=;
        b=J61NADb9jfR4z8kYp7/TMjaZ/NtBV5IG49ddpJPzTslPoHTbmrHVtedigQ+Y8aF567
         gaFCM5SQhXGxEteFvzdwPUbUug1ri+ryWbJjs0RfMc5XLeNgxPlYRcVl0z9EdCyyQcis
         PCWxICl/wSKmRd+EepFSm9QgZLPtasuVkY8hz2QLXHCtCMGsfo0re019qIu/keNCUanF
         Byehtd2PxtGYw61eWqO3OimoXDZe+Yae5seb+jH1cf2ci0S1XUVNSVa1GKwi0MoGwUJ6
         Q/Hl7UOKKorxwVkIlNXqIF51BGxqNP8+ZPgBtnSDRKqJM4f2CGDcirMhfI1ATnHxqPUH
         +vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867124; x=1760471924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i+DaBHwLGUsHUY6K5jBAv25/GP5doDNsw2CwcVczb4=;
        b=RGE/nnhxncnfGTMxgHYyaE/y8sPoa1pjq132ydBrmJ9I0zUJ5kV70lk+IrCkSGP+a6
         T2Z6Ay0mDsjlhI3L7XnX4WWOfT88qVcp0CiCQq9kiYjO9q5SSyBkZu7uvXK9Jjleoxy2
         orM+HRdTUKK/whoUHl5OQ86maYIy6oGuZVszbOcGIfLID1A8zB6icfM5dOcgbdDCDmhG
         CPBKN5gQqr+924JWsLdxfk2DBxKsetkGE7hso2j146I+thV3Nuimrh85Jolwl2VlEhW7
         j5L0ggfdORRtJye3CpnDCBXO3KALls7923UQTDC2X9c4UuTqYtutgn9zOYw31Th1FGXz
         JgDw==
X-Forwarded-Encrypted: i=1; AJvYcCUMsS9lfaLYuPpqRWXJryAwvC0E5LeRxowxjW0O6KIsZsT8zchNnqD15Ov5V1dK20ip59bfIN2+3IKbrOoUUZ52@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZPtA3XH9wfvIVzQHGhdxVTnL0RKBmndsLnRl6+jty0afNODq
	xBRqgQR/Vmoa33jEgD0FFDaraVBHwDvYe4m+sdE/x6Fmko9UFDFpzbfQ0kIejDIdHE9LM8eTGNJ
	aAdHhTmQuY7mAW+TJwBvIKtVd6a6kjHI=
X-Gm-Gg: ASbGnct/wqijKtVlVsBu6NTT19wBKIl1P9P7j8RL3Zd2qQfMMJtjYLfNpRXVa4yXIqx
	/t5xSgBf/g/7G03mmKfV9lryqwwFpPtaYbdFhS76ay8T9uD5n+blf3J2BMGSzNrIA66UYypiRvS
	4ezzyFIt/K1bREwn88tP8DXMAPGgMJdwV8ZBWpAoNaQpsapQyR9Zk3qRXUeBlNLZ/0aJqSlljov
	h0xHy1G2lLiooh1NjciZoBpLo0rYz3O
X-Google-Smtp-Source: AGHT+IGhQKkdli6ChcrJrimzDRILIPBEJx1WIJJeyZJZFyHu1VPQ3s0BSJb0Cf6sOL/i1+AZT6DQ2HmJtJquPatajTU=
X-Received: by 2002:a05:6808:1308:b0:43f:2b18:1612 with SMTP id
 5614622812f47-4417b3455dfmr434630b6e.1.1759867124222; Tue, 07 Oct 2025
 12:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007151828.1527105-1-tanmay.shah@amd.com> <20251007151828.1527105-2-tanmay.shah@amd.com>
In-Reply-To: <20251007151828.1527105-2-tanmay.shah@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 7 Oct 2025 14:58:32 -0500
X-Gm-Features: AS18NWDxvii-SmcMeBcWQyfvAXfhvWegr7D7dXo5LN4u6HIGbavoNq9Ctlx_6e0
Message-ID: <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:19=E2=80=AFAM Tanmay Shah <tanmay.shah@amd.com> w=
rote:
>
> Sometimes clients need to know if mailbox queue is full or not before
> posting new message via mailbox. If mailbox queue is full clients can
> choose not to post new message. This doesn't mean current queue length
> should be increased, but clients may want to wait till previous Tx is
> done. Introduce variable per channel to track available msg slots.
> Clients can check this variable and decide not to send new message if
> it is 0. This  can help avoid false positive warning from mailbox
> framework "Try increasing MBOX_TX_QUEUE_LEN".
>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>
> v2:
>   - Separate patch for remoteproc subsystem.
>   - Change design and introduce msg_slot_ro field for each channel
>     instead of API. Clients can use this variable directly.
>   - Remove mbox_queue_full API
>
>  drivers/mailbox/mailbox.c          | 3 +++
>  include/linux/mailbox_controller.h | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 5cd8ae222073..c2e187aa5d22 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *ms=
sg)
>         idx =3D chan->msg_free;
>         chan->msg_data[idx] =3D mssg;
>         chan->msg_count++;
> +       chan->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN - chan->msg_count);
>
>         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
>                 chan->msg_free =3D 0;
> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
>                 if (!err) {
>                         chan->active_req =3D data;
>                         chan->msg_count--;
> +                       chan->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN - chan->=
msg_count);
>
No, I had suggested adding this info in client structure.
There is no point in carrying msg_count and msg_slot_ro in mbox_chan.
The client needs this info but can/should not access the chan internals.

thanks
jassi
