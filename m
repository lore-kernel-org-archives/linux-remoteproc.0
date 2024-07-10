Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843C37169
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 03:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720581931; cv=none; b=eljFKW2wMCQ97AjmQ5w3Oh4uM4rpQm52g5ChMevngNFkFzNMkZ3ZpXh3QYexQovF7wdvuEfQAX85ZsoT9ERJBl4g9KoPn48u0fFj6D1gxEUy5vyoUo0bzDwEXoQHOuPxzN6NNBkiUjxg8dzvq+XCJ39IYu9Uo/saRXKS10Ep/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720581931; c=relaxed/simple;
	bh=9sbwGihOLkbKRAKocXOlId4hhNDwPbs0zE0X3aDWblY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaYZPDb66N4NIOS+YPoeK1XzdYyt7vczF9gj4hhpLaqJq01yEUzbm8+hZw1IRiHtbsJVuQD2JJs8ebWLig8CASBvXUXjZduTvX4AeWeZ2jDXn3X0MP/JQDdoRmnGp4GQN2QAZn63s7EZCg1PumNkQkIgLIqJkew/3ZcbYXb5S78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J9+gW/ky; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J9+gW/ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720581929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sbwGihOLkbKRAKocXOlId4hhNDwPbs0zE0X3aDWblY=;
	b=J9+gW/kyku5xY2J5dOvBApjGnq5sERW/z81ud9o6asJToE1L8TmPbeJ0ioCAj4/oEOdgQF
	b8M6MKImF1v6S15mJ+SiP1tCeYxwRE9HAdOJsttPSRdCaqbFsQUpXjdTwHDt+vdBe+L4+d
	/VIKsfoOgvCfTiHB5URXENTNWVaI8/8=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-Zxo6O--VPECon3S6-0vv3w-1; Tue, 09 Jul 2024 23:25:25 -0400
X-MC-Unique: Zxo6O--VPECon3S6-0vv3w-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3835285561fso66184265ab.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jul 2024 20:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720581924; x=1721186724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sbwGihOLkbKRAKocXOlId4hhNDwPbs0zE0X3aDWblY=;
        b=dmsflQAfT9kL+LC6YQHSK8UMIOYovzr9f4IqNgxTJ16TDs9nsAT5CztN4Lo8BDAGCD
         RiLI3j+FZ7HjRSvndym9WgN8V0RgsREmeIhPLHBJm7pn5eeQMZt6WNSwuATIEaom7WV4
         +ak1bGZPxpySNoenVo3jOsKraBmvnX1QZTozWSLAc5HFNf3PYDR6xmCa4Kwxt2XgONWs
         HRP4YGOz6x263286luv5cnZrVBmbKTkPB6lFXSmvBouIME+oqCkJYrFOr466yWPJvcDI
         DSYiDN/S4XwGG4y0aALzbrkTADtDPwxS0+22meCwHM651CbtkiJ/lU+V7pTmWjcUW43u
         aO1g==
X-Forwarded-Encrypted: i=1; AJvYcCVwZlLD19ccEYwqvz6cmCg7lhj7GpruSW3Ay7Qqs5nBtx2DQrEeyF0Ikm1lxAxHSsZpByXiFj1rqE3X6XsxmWoPbHvI4/zyBnJYUhXBx37TTw==
X-Gm-Message-State: AOJu0YysC9ARZSYRev6e8rTvz5McflTdu5nL92GIe8m03+f0iqiohhDK
	LmU+g3I61oZLr3BbA/3K99fRghAlwDo1Tug2fRfQvyX8ONVBBhzHDgMPsbd1G6PTASrLFDGCs4U
	ZgGRxa4+izWwcWhL/O65RY0fh/ha1LD2lgTOVT0ZBuVGqZS/kCe1K/aHs+5iZfwsALGkfTWDcf4
	6gphD+JMimLIWDcHYBkM1CHwuu+EZmFLrZ+G+y4+yr0w==
X-Received: by 2002:a05:6e02:170b:b0:382:b436:ecbb with SMTP id e9e14a558f8ab-38a57bcd755mr44254715ab.11.1720581923966;
        Tue, 09 Jul 2024 20:25:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW8tp760Eusr7cpOewOOzt8KywljVE5imblpi4EA9nOMhtnhRxpdbKT5KwR6ZV/XXWj53jrT/VMHmkMmslXtc=
X-Received: by 2002:a05:6e02:170b:b0:382:b436:ecbb with SMTP id
 e9e14a558f8ab-38a57bcd755mr44254435ab.11.1720581923592; Tue, 09 Jul 2024
 20:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720173841.git.mst@redhat.com> <1a5d7456542bcd1df8e397c93c48deacd244add5.1720173841.git.mst@redhat.com>
In-Reply-To: <1a5d7456542bcd1df8e397c93c48deacd244add5.1720173841.git.mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Jul 2024 11:25:10 +0800
Message-ID: <CACGkMEsg0+vpav1Fo8JF1isq4Ef8t4_CFN1scyztDO8bXzRLBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio: fix vq # when vq skipped
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexander Duyck <alexander.h.duyck@linux.intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	linux-um@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 6:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> virtio balloon communicates to the core that in some
> configurations vq #s are non-contiguous by setting name
> pointer to NULL.
>
> Unfortunately, core then turned around and just made them
> contiguous again. Result is that driver is out of spec.
>
> Implement what the API was supposed to do
> in the 1st place. Compatibility with buggy hypervisors
> is handled inside virtio-balloon, which is the only driver
> making use of this facility, so far.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

