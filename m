Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2439D4D6C57
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008124; cv=none; b=Ig062UMTSAMjnYZX8l2T4eFntCl9oaGoNgzLvyTrnywgi4ytL2rQMMEv6aJkG3BA4sVhY9JM/9HeNGoD9ikpPAP7f7H/qT6HgII7GHvepi/CAD2YNajsIp1gEKsR18vqR+geY3yoeXPG6DEOk0U6pEYhcNke17yafx3tftMGDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008124; c=relaxed/simple;
	bh=Ei/lMDbqtinZc2yiBLQAMSXEoLG4Je+V+bGkXlP0VYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RDRkcMcLAnvfIxBgu9LrX3HT7BrjXA6N9l+hPW9M9sm5zYsLYtH/sxP8KhwiJa+Gz13Lh7xalQfqLQiBsMFB1Oxf4Fr4bk0086SYQ9VTUnYWtLX1xFaJbCRZAsl6QabI5vGf3jYVroC76EghfBaa+CG6RZOuqRFUF/Jxp6AcgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/06/YAZ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/06/YAZ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so1408951a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790008122; x=1790612922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4G340J0PDbk3TvCsLvJzIITRUJ1wAT/vSIriLlX324=;
        b=H/06/YAZBLtuYf3AuZ60eF9ft44hb2CoZRlmIc8r8FaXSY34kQtWjMCZ5dZhh1U3wo
         K6vHkWAFFPTr+fdB9/3lXE5dk3Tiq5vbjSvnmdzKYh3fARIyI9weAWi1+a+K2qw6/G3Z
         ycbXdLEAOeF0wSG7SVt/tJR/gVlB9Fl0O/emtb223N9PWHRH+4IPaAld16QF9u1yvcb5
         l38RpG63Jmv8kCqJtzSLoIeyjYgzguOU4rX9EXLbbrhxnCbsY1/SoULPrI0A5kjr4PmM
         vJila0W45XK+56Ofo9n/ipsg6oo2i92M6ch3kEnsk1SkO7k6yUnPRsMAECGxU9ruKTMo
         dz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008122; x=1790612922;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t4G340J0PDbk3TvCsLvJzIITRUJ1wAT/vSIriLlX324=;
        b=Dj0VB35nndieL0AGEIzszPtfaWeIgXEeIvEfpdT0i2nPgHoMqIFnAZM3LzjhjroO25
         s/wuWv9iJJ36Azaf7UgebQnHQ8WoVJRadO7LxPk4fXePVINYvYF+l3ZNoSlwbcYawSlb
         5OzcYnzezmbQguCs8cuuubf57j/+saP0evNA6vp21qZq4ndc8QylpdA0MvsM8M4IgT/2
         U5Z2u5HmoBp7ujGFpc44/GxI/81g076coEh7/m2C/3TrPMiE5WMmy6hxxYwP6KOu2E2y
         xqJN6s33j6jquUbGOwPcWTeQMit9pLratcxyAYMjjYkQ4vXlUFU1iNnjX61VX4f8eQ7m
         gg3w==
X-Forwarded-Encrypted: i=1; AKwUvByCABm3dtNb8vDw9HuqXLoaHIYFU3J36T42YjCurI9MxU4U9NygRtmseUJT8/KJmPwpxN+Bq8P24z3rQpI3Slh2@vger.kernel.org
X-Gm-Message-State: AFuF++kuyrwGntl9u6nJ+vw9PyNzXzoUiw/0k0SY7/fw0hS+vs22f37L
	NxiNNeLxfKlSvZRekY7wjwPHQ+6BY0/MCLOCyeUsjuBx0eF5owH9WoiV
X-Gm-Gg: AYBFou0Yt5/68Os8kwCjwpLPUrjqzDWYCmu6qLPnl8wQLIPaa2karL4YRQFxILAkHjk
	3c1YGJxATiHUZjeCmC4sqhh4I1gTxXSwzMYyhxUqhMWN+CCaZt6dVKc2vaHpwVL7vdg8HkYLOoN
	9y6lGcZuuX/Zgz0gz8Y9633UcTNellNaaVTkcu3AZjtjYc1Qo+PRiF47SVRI0/tGuvmYFCuZiCM
	s+eSLnaasPk94IPUlbO0lCwX1xml0OG8BATocUWVRQQ7E1QgzKwF6zrM4+5GfICiEHTpOYX7syi
	EFdm+FSQIWvDWBz/xhmfqhPRAxyEDOkqVv4tBK6ksUYLWOpopeW6iRa8QkXXiH6D/W3Kscls5Md
	Jxs45jAxCqX9PWMguI6cQMwqNEUo4swHI3z0s7v9M5kuBZRenghp33K16oix/doYpLG1ySvoNSv
	sdhvVcKXz08h3kcJ3f5ZzfpMWfpwUC4g6sWzydhC7VYHqQqBaDAR0bgt3jhxN6I1KHiZRPpd8X2
	Yl0gX2GojzI5Epl9xC6naKr
X-Received: by 2002:a05:6a20:4310:b0:3dd:85a8:cac9 with SMTP id adf61e73a8af0-3dd8c47c24cmr15340142637.32.1790008122351;
        Mon, 21 Sep 2026 09:28:42 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee0fbasm3746033a12.25.2026.09.21.09.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:28:41 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Jiri Slaby <jirislaby@kernel.org>,
    linux-remoteproc@vger.kernel.org, linux-serial@vger.kernel.org,
    linux-kernel@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Subject: [RFC] tty: rpmsg: possible lookup-to-reference lifetime race
Date: Tue, 22 Sep 2026 01:28:34 +0900
Message-ID: <179000811428.1227592.8003229121862460039.idr-bug-84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I would like to report a possible lifetime gap between looking up a port
in tty_idr and acquiring its reference in rpmsg_tty_install().

The source reviewed is mainline commit
5dd1818b15d98d4a20806cd00b1b40320b06004f.

The install path calls idr_find() without idr_lock, stores the result in
tty->driver_data, and calls tty_port_get(&cport->port). The port destructor
removes the IDR entry under idr_lock, drops the mutex, and frees cport.

If the last reference is dropped during that lookup-to-get interval, the
following order appears possible:

    rpmsg_tty_install()              rpmsg_tty_destruct_port()
    -------------------              -------------------------
    cport = idr_find(...)
                                     take idr_lock
                                     idr_remove(...)
                                     drop idr_lock
                                     kfree(cport)
    tty_port_get(&cport->port)

tty_port_get() uses kref_get_unless_zero(), but this cannot protect memory
that has already been freed. The install path also does not check for a
missing ID or a failed reference acquisition before tty_port_install().

TTY installation is serialized by tty_mutex, but the RPMsg remove path
does not explicitly take that mutex around its final tty_port_put().
The destructor can consequently run from RPMsg removal, not just from
TTY cleanup. I have not established all cross-subsystem ordering rules.

A draft takes idr_lock across idr_find() and tty_port_get(), and returns
-ENODEV if no live reference is obtained. This uses the mutex already
taken by the destructor before removing the entry. Its scope is this
lookup/destruction gap; it does not establish safety of every probe or
remove interaction.

The draft was compile-checked as rpmsg_tty.o with W=1 in an x86
allmodconfig build at the commit above and passed checkpatch. There is
no runtime reproducer with an RPMsg endpoint or sanitizer trace. Device
permissions and the ability to remove the endpoint also remain relevant
to any security assessment.

Does another TTY or RPMsg lifetime rule prevent this particular overlap?

Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM

Thanks,
Sang-Hoon Choi
