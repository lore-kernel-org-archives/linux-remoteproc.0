Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7721FF5F
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Dec 2025 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764814431; cv=none; b=Io1DZ7Ueixq8yhOIA6lvcfQFdx8ag9D80u+gqvs/i3lybvNibtX+oVVZx2+E3eisLrSs2rkvEpXHIhhVsr7A719uJTZGqMMGXHwc+2NIxDgMUsMb76V089oGfmoBtEk2oRv+F3X1iCwPfxqDR8KBKB0237mGpccSQS/TKiHScbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764814431; c=relaxed/simple;
	bh=Bd4K1YtKNoEERuMs0RolaDt0ScTVx+zEHG9IVgqpbo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7LRwy7w7D0jG/6nwLNiLFM8a2tODvKZSUbGfveMJObRv6O37PJlaiu+Pi4EkqHdd8F/QrPR5FRLE3YilwlvoAhvILmY8QK0df0Zw3M3GJP1DQ1AX2LJa3E1t+gXWa+b0Vs7qUEx2Z+5AmoqO+nbXGHiium2CpIrjaGvWXbjwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9XYDrwo; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9XYDrwo"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c95936e43cso131006a34.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 18:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764814429; x=1765419229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xORHJgL+aGizbKJeyZszhgEnaCMXYKlt8oGjGv96pcI=;
        b=k9XYDrwoZfM5DvcBVL7gebrcCl1eA64YkpT88JbD4VN4I/4cPTe8rSNGlX3NmPcvLT
         qqvKtf9MxL80Ju14FFC8K0jn2m+ZtouvOkMQrIVD5LCTMJq8TAXSEdwVNL5IJTPGMBhU
         pyrNI+lKtrv2/R0pEyVOfSh23h0jFGmwW4DAkBXdHwNo0GpWN8pl7ES0Zf8zQIiBF/kE
         hv7/3cU7c2NylGdTGjDDjDdUzhlarrXkR3Wy5/bflPXsOOtwt/SChhIvZ6QuyK98uJDd
         dZkOEiLjWLC+Xz3j04GwyhMkWQuwKblerxh2q8/N53TQTW+8sSpkgJiw881ZC/11e/XR
         TB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764814429; x=1765419229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xORHJgL+aGizbKJeyZszhgEnaCMXYKlt8oGjGv96pcI=;
        b=LreHElqJbITtf+KF6kJp7UvFP6sUs4+U1E0lWVtWX0Jej+FkkCfTLNrxbwimEoOTc3
         rjX9XW0T+ZsenMaCHXiQCHbKBrc9KK4CUNnguLov4L6jEpQfj3WIgH95RQOCFTkH01At
         6y0z1E5xz6U0ahhZC7IB+4Whn/Xn7VBZfisyh421MvCQXc31qJ7UkzCQ/W0+FtVxmkM0
         XZL06U5hUGGEX2DYuaQcQTo64IOKo+sruYwzCsWerLmBcVHvOfk5nDku3B7JfONobbjZ
         VvQE2XZv+Z78VLCPmUuwkWbY/kqQOyiNzpFsQKdxJBwrBE0KyWUqJBoihYwSJT9KSaVf
         gYsg==
X-Forwarded-Encrypted: i=1; AJvYcCXdrES4tBgbmT5riatVJyimwVPqTio9wbLrTNJtwb9cJFI2OBzztzIF5PVnsvTyBIruVW76K4Xd6gxceB+h8mRw@vger.kernel.org
X-Gm-Message-State: AOJu0YwloCwCgExI4FonHhWfWqR7xLvdKS4sh3laVPjtF5SdS+ZW/x3b
	p9wnivRv1zcpRsYD1BCDCdZkWKb/aqG/mE5R5y3zA/ZYpWBG7tgseWtax1VfL7NQUCec4+MRemG
	fn6ogUroMbFw1/PnntWLva3mBSi/enQE=
X-Gm-Gg: ASbGncsbPSww5FCRy3hkaTtxoEhCIFlAb0ZmHpeVCo0uR/Ae+K0u5L6LoxmPecBxXqI
	r6qiJPUDyFmg9BwWEi3BMrcja8k236kAZ5XBn1ZdYYLBu9qga/1HgiWY5m2PPLXkRtDCrAmm7wg
	paAOzBtqB9bnoj2KO4qNkjVXGm0uk9f+/U2Bs+A+u6ErROMeO4005DhcSKfodSVUT7QTQrd0azP
	+7E7rTSkrqsYo3hX5/FdlTfFzdAVjasioYeEqP9HWoCFZSJfJoRJcZi1jqckD2reuJ3CK8A
X-Google-Smtp-Source: AGHT+IFwbzJfKP3QZXBd643uEhegzxd6VbdGf2JDLH3puDF7rj0n5xOB3XHYqb7RgWQQbnnXY7bKYRb25E38bGf0yLo=
X-Received: by 2002:a05:6830:4118:b0:7c6:cb39:adf7 with SMTP id
 46e09a7af769-7c94db0ca70mr3417936a34.6.1764814428695; Wed, 03 Dec 2025
 18:13:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007151828.1527105-1-tanmay.shah@amd.com> <20251007151828.1527105-2-tanmay.shah@amd.com>
 <CABb+yY0m_Whm1F7d2ub+vhn0eTb47UC9g=JvpLnWh-2E1oo52A@mail.gmail.com>
 <aa1ff206-d505-433b-9715-56d866a5f675@amd.com> <33edad1d-08b9-4fe4-8525-a1f50a898e2f@amd.com>
 <CABb+yY1Y90S_dbybMT07PTvmy60W2mt3mHdP56sp6DO75bpuNw@mail.gmail.com> <c9f65597-52ba-41ef-842a-2569c2074d6f@amd.com>
In-Reply-To: <c9f65597-52ba-41ef-842a-2569c2074d6f@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 3 Dec 2025 20:13:37 -0600
X-Gm-Features: AWmQ_bnHLkr3Qycd2BPcthiErEVM85UAFY3lOTD20xSabGatzUan99jxWBnqHEA
Message-ID: <CABb+yY0qZktWThE82RppmCN1cC=UvKkKp-F3T1ydwiUfyOZGkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 12:51=E2=80=AFPM Tanmay Shah <tanmay.shah@amd.com> =
wrote:
> On 11/15/25 11:38 AM, Jassi Brar wrote:
> > On Wed, Oct 15, 2025 at 10:27=E2=80=AFAM Tanmay Shah <tanmay.shah@amd.c=
om> wrote:
> >>>>> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> >>>>> index 5cd8ae222073..c2e187aa5d22 100644
> >>>>> --- a/drivers/mailbox/mailbox.c
> >>>>> +++ b/drivers/mailbox/mailbox.c
> >>>>> @@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, vo=
id
> >>>>> *mssg)
> >>>>>           idx =3D chan->msg_free;
> >>>>>           chan->msg_data[idx] =3D mssg;
> >>>>>           chan->msg_count++;
> >>>>> +       chan->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN - chan->msg_count)=
;
> >>>>>
> >>>>>           if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> >>>>>                   chan->msg_free =3D 0;
> >>>>> @@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
> >>>>>                   if (!err) {
> >>>>>                           chan->active_req =3D data;
> >>>>>                           chan->msg_count--;
> >>>>> +                       chan->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN -
> >>>>> chan->msg_count);
> >>>>>
> >>>> No, I had suggested adding this info in client structure.
> >>>> There is no point in carrying msg_count and msg_slot_ro in mbox_chan=
.
> >>>> The client needs this info but can/should not access the chan intern=
als.
> >>>>
> >>>
> >>> Hi Jassi,
> >>>
> >>> If I move msg_slot_ro to mbox_client that means, each channel needs i=
ts
> >>> own client structure. But it is possible to map single client to
> >>> multiple channels.
> >>>
> >>> How about if I rename msg_slot_ro to msg_slot_tx_ro -> that says this
> >>> field should be used only for "tx" channel.
> >>>
> >>> Or is it must to map unique client data structure to each channel? If
> >>> so, can I update mbox_client structure documentation ?
> >>>
> >>
> >> Hi Jassi,
> >>
> >> I looked into this further. Looks like it's not possible to introduce
> >> msg_slot_ro in the client data structure as of today. Because multiple
> >> drivers are sharing same client for "tx" and "rx" both channels.
> >> [references: 1, 2, 3]
> >>
> >> so, msg_slot_ro won't be calculated correctly I believe.
> >>
> > I don't see it. Can you please explain how the calculated value could b=
e wrong?
> >
>
> Hi Jassi,
>
> so on my platform I introduced some extra logs:
>
> [   80.827479] mbox chan Rx send message
> [   80.827485] add_to_rbuf: &chan->cl->msg_slot_ro =3D 00000000ab5fa771,
> msg slot ro =3D 19
> [   80.827494] msg_submit: &chan->cl->msg_slot_ro =3D 00000000ab5fa771,
> msg slot ro =3D 20
> [   80.833064] mbox chan Tx send message
> [   80.833070] add_to_rbuf: &chan->cl->msg_slot_ro =3D 00000000ab5fa771,
> msg slot ro =3D 19
> [   80.833079] msg_submit: &chan->cl->msg_slot_ro =3D 00000000ab5fa771,
> msg slot ro =3D 20
> [   80.837486] mbox chan Rx send message
> [   80.837492] add_to_rbuf: &chan->cl->msg_slot_ro =3D 00000000ab5fa771,
> msg slot ro =3D 19
> [   80.837501] msg_submit: &chan->cl->msg_slot_ro =3D 00000000ab5fa771,
> msg slot ro =3D 20
>
> Tx and Rx both channels are updating same address of msg_slot_ro. If
> user wants to check msg_slot_ro for Tx channel, then it is possible that
> it was updated by Rx channel instead. Ideally there should be two copies
> of msg_slot_ro, one for Tx and one for Rx channel.
>
> This happens because Tx and Rx both channels shares same client data
> structure.
>
> Same can happen on other platforms as well.
>
The queue is only for TX.
The received data is directly handed to the client. So RX path should
not be modifying that queue availability variable.

thanks
