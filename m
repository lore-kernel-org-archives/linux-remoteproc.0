Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4B1E9B1A
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Sep 2025 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759253628; cv=none; b=JUtkos4q1e3/8gR/prDF13xRFQPMEKJsAZhlbxAJSOp+PIn3tXk1+GrNDHfAQebfherQJJz74mFsoiDcOM8jTI4c4gIp0k/5CC6+ULkgVyMPaicvCMWUtBh7x/o5fxtXjkcwb5H9SQ1WalO0Ge6XUzsMOWDDNqk78ZqClixkSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759253628; c=relaxed/simple;
	bh=7oaqfY4n8gvCo3G5WCbSUF/1L0kT2TAijUBs8QVAX/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPNjRdI2cWp9OJLWIKjoduZLkseki/bxqZPAXZhcojyNfPYPgVRSTAJJgXCIlbTkv95neOkUZV101YYcoXigjNSoXJsqoFc2vwqhQ9oVPkU54MZRo46Z1/s3Hd9WtEKLzuvPAYq5B7zEf/dYVDwghVeNGlq7UIdeHMOqik2jWxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zpq4a5UF; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zpq4a5UF"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7b4f7a855baso2169449a34.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Sep 2025 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759253626; x=1759858426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOQJc76/bjfzUHkGEG4L0ifBSjFnFM5dvfGqeltjYHY=;
        b=Zpq4a5UFnM4wkNcemHIaWOwoN0YL3mMN0vgMhADhYWn4jonhuLJJH1wthtOKepgMcT
         NLkO8vN0am7ACUBhrIqGwvtEQZC8CK5Rgo4PdDwRrZhMQHgIQkSiCs3AIZBj1Cwhfko0
         JgEggNpPpha6oum7E/U5tRvDU7GkoB9ce2IXevkP/KvxosJ3FzoxEYoQBfRQDAtRFkmk
         Z8YsS6r+rjr1XJobofGW5XAUmYyL3EfXMUmmdNTEKY/Ga920UPd+0ndmM+k9wzIaMOfK
         rlH1evPNbsRfRZhoSJvFm9i+IX1yvYWXEzZALjNTNhnQQKnhgp5IVletkAvOyIELCbE5
         YSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759253626; x=1759858426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOQJc76/bjfzUHkGEG4L0ifBSjFnFM5dvfGqeltjYHY=;
        b=vRS3K/Jc8tHjtciXbWmT3w4SjlsiRuhN20QUr8GvqIm4023XebO95AfFhvVisTbm0F
         mCf/YAyWTfHrwoo+9nyt9P5cmY9BH8SjCVuK2L4yDwJroIC79tp3QTHOl+WkqB9TamKW
         +K3ZEo8urNkJkbhVx7tJzxwp67cQV3AHKTy1jkKu5n4bbUAWpo3eywG7YV8bXDM8WwE3
         zxPDoKYMfwGh1iF2Jo+pG8eETEy6UETdsUAJue1fUzePua8PcSIn9FPNeA3TgftY76Wt
         SL2grsm/DOiKi60UFS19THFaUG0M33XXCNerFbL5UQjosC+K+NGX3ZrK4oDj3cismc2N
         a3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ho9bbyu0TeuO/f5Lg+aqaE/QT5dwNVkzBo1kqNvuApblgHMh77y4Dv7Z9NpIdsGF6VAp11NGPSGFZGEcRS9G@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQzY1vMpG1xN/FWQZiF4vb8u3K79AseKiTZ68XDsv09pdI/X0
	ErYHlpXHHO6b5XIHxhKBYcYmLXBhPMhxWhpIw27hAQaL14MJVpFgtKlhuo+8yv10kV9UVkh+j6k
	zEfKy+/KTn7BefoNKJLxiLsG0akdPrX8=
X-Gm-Gg: ASbGncuOBXWi7nxZXyOqwcoPe2ezzfBPHoXpHJgynkKcdkNXxuQJSmDAnqUJ8TjRcEb
	+KZYGe23FX28jr/fhQsNnpKUWGcBx7Ld7yR+uSpMIms/kKmbvVWT7p3zA/4RqEU5HhEQ8pqDsIE
	vHZJEDjHBIRYaIX5FH/v81mm8yBbOF421iJyLM1FwJmTuJ9h6jrgmwrbGgmcAUL0MwAArys+fB8
	SXKpTjj4z1RFxgDv0gBrpDa5m/I2bD8
X-Google-Smtp-Source: AGHT+IGpOWfgvUg+G2VayONLt47j/R1hMVCBp8a+ycGnyRMKxU5QNMPGQonL1pcFoIep0QFwgJqh3mF74MDopg4J1p8=
X-Received: by 2002:a05:6808:4441:b0:43f:6654:c757 with SMTP id
 5614622812f47-43fa57a45e8mr9771b6e.33.1759253626212; Tue, 30 Sep 2025
 10:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925185043.3013388-1-tanmay.shah@amd.com> <CABb+yY0MzJWOGtS=ocphpUVcJ-gb6_ENCjSmJQiWfRiOhxrpCg@mail.gmail.com>
 <3ecf0bb8-a1f1-498f-8b7d-39483a67cbfc@amd.com>
In-Reply-To: <3ecf0bb8-a1f1-498f-8b7d-39483a67cbfc@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 30 Sep 2025 12:33:34 -0500
X-Gm-Features: AS18NWCDmfzO57z9_IeDFtwzy97PTjLYrAOUglA9BCgS4QvjFmFKG7a3d3QwQI0
Message-ID: <CABb+yY388YaM=wLMy1aaDT0E1yN=7Ge2taMWMyEhWvyqDV=3Dg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: check mailbox queue is full or not
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 11:52=E2=80=AFAM Tanmay Shah <tanmay.shah@amd.com> =
wrote:
>
> Hi Jassi,
>
> Please find my comments below.
>
> On 9/30/25 9:11 AM, Jassi Brar wrote:
> > On Thu, Sep 25, 2025 at 1:51=E2=80=AFPM Tanmay Shah <tanmay.shah@amd.co=
m> wrote:
> >>
> >> Sometimes clients need to know if mailbox queue is full or not before
> >> posting new message via mailbox. If mailbox queue is full clients can
> >> choose not to post new message. This doesn't mean current queue length
> >> should be increased, but clients may want to wait till previous Tx is
> >> done. This API can help avoid false positive warning from mailbox
> >> framework "Try increasing MBOX_TX_QUEUE_LEN".
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>   drivers/mailbox/mailbox.c               | 24 +++++++++++++++++++++++=
+
> >>   drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
> >>   include/linux/mailbox_client.h          |  1 +
> >>   3 files changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> >> index 5cd8ae222073..7afdb2c9006d 100644
> >> --- a/drivers/mailbox/mailbox.c
> >> +++ b/drivers/mailbox/mailbox.c
> >> @@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan=
)
> >>   }
> >>   EXPORT_SYMBOL_GPL(mbox_client_peek_data);
> >>
> >> +/**
> >> + * mbox_queue_full - check if mailbox queue is full or not
> >> + * @chan: Mailbox channel assigned to this client.
> >> + *
> >> + * Clients can choose not to send new msg if mbox queue is full.
> >> + *
> >> + * Return: true if queue is full else false. < 0 for error
> >> + */
> >> +int mbox_queue_full(struct mbox_chan *chan)
> >> +{
> >> +       unsigned long flags;
> >> +       int res;
> >> +
> >> +       if (!chan)
> >> +               return -EINVAL;
> >> +
> >> +       spin_lock_irqsave(&chan->lock, flags);
> >> +       res =3D (chan->msg_count =3D=3D (MBOX_TX_QUEUE_LEN - 1));
> >>
> > 1) If we really need this, it should be
> >          res =3D (chan->msg_count =3D=3D MBOX_TX_QUEUE_LEN);
> >
>
> Ack here.
>
> > 2) I am thinking instead, introduce a
> >         struct mbox_client.msg_slots_ro;
> >    Which is a read-only field for the client, denoting how many message
> > slots are currently available.
> >    The mailbox api will always adjust it when msg_count changes...
> >        chan->cl->msg_slots_ro =3D MBOX_TX_QUEUE_LEN - chan->msg_count;
> >
>
> It's not possible to make msg_slots_ro true Read-Only. Nothing prevents
> clients to write to that variable as far as I know.
>
Correct, nothing prevents a client from changing 'msg_slots_ro', just
like nothing
prevents it from setting tx_done or rx_callback to 0xdeadbabe.
The '_ro' suffix is to tell the client developer to not mess with it.
I am slightly more inclined towards this approach because it avoids
adding another
convenience api and is more immediately available without needing a spinloc=
k.

-jassi
