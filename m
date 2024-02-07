Received: from smtp72.iad3b.emailsrvr.com (smtp72.iad3b.emailsrvr.com [146.20.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CE8288A
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Feb 2024 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707330109; cv=none; b=LxmtfMshgNN6ka+pzd4HglXJhTjfCRwork70xVHgJXbRTSHwFkPkYGlqbPE8yUZfq9QcITTeZDqHC8oVPihwqfwbJyQSL53Vb0KVlRro32M5odLOG6/lUcHkRcT0Xrip9tV6mEBKzVqCPIEUAZXP/MFqlT7Ac2JZpj9rwqfagHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707330109; c=relaxed/simple;
	bh=vQCMGtZuEopgvy2i8XJT4PRWSS9SwrBft8XcL+1wrjc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bSy4cBinBUYSVrBST9vG7zWJdjktq+qXQrJ/dUPyYE8obUZYPnz3hHNWohcDqk42JlnfQcnzc0nklzKM2tZfGgnNTBJHkKBeunsQ0tq6o2JyZIylEifQiyHS2/92GobSTuYihxZYeB6AMhZjAmtRoKZIrF+P+pDRqgOARhWRjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=data-bakery.com; spf=pass smtp.mailfrom=data-bakery.com; dkim=pass (1024-bit key) header.d=data-bakery.com header.i=@data-bakery.com header.b=R3aqgDIx; arc=none smtp.client-ip=146.20.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=data-bakery.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=data-bakery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=data-bakery.com header.i=@data-bakery.com header.b="R3aqgDIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=data-bakery.com;
	s=20190217-thytx7dm; t=1707325554;
	bh=vQCMGtZuEopgvy2i8XJT4PRWSS9SwrBft8XcL+1wrjc=;
	h=Subject:From:Date:To:From;
	b=R3aqgDIxgN3v3WO7sWNXej4XHO+dNIiVO7L++AVMylJax0Ns9pvJ4cJAg7AqZI34t
	 Tg3SY7KVMLQoAjAgkl4ByScwXC3xAWDT6O6dXgHrWeuYMVgsbgOC52rmr/Cm7Sh20a
	 QbZaj7f34df3cYaUDvPD1RVuJoFunnCr0oEP5sig=
X-Auth-ID: dhess@data-bakery.com
Received: by smtp2.relay.iad3b.emailsrvr.com (Authenticated sender: dhess-AT-data-bakery.com) with ESMTPSA id BF02D200AC;
	Wed,  7 Feb 2024 12:05:53 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: Kernel panic apparently when writing on RPMsg TTY while or after
 coprocessor is stopped
From: David Hess <dhess@data-bakery.com>
In-Reply-To: <ZcOv4lZVOtSiLdrY@p14s>
Date: Wed, 7 Feb 2024 11:05:42 -0600
Cc: Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B4F8677-B210-4129-83AC-0F860C346957@data-bakery.com>
References: <4BB17D7E-D9BD-42A6-8E1D-6C6CF0C218DF@data-bakery.com>
 <ZcOv4lZVOtSiLdrY@p14s>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-Classification-ID: cd623963-f9bc-40d6-97a2-effa08c1794c-1-1


Ah, didn=E2=80=99t realize that. Apparently it lives over here in an NXP =
fork that hasn=E2=80=99t gone upstream:

=
https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/rpmsg/imx_rpmsg=
_tty.c#L81

Found this other report of basically the same issue while hunting that =
down:

=
https://community.nxp.com/t5/i-MX-Processors/Kernel-crash-due-to-imx-rpmsg=
-tty-write-attempt-after-rpmsg/m-p/1556530

I=E2=80=99ll followup with NXP on this.

Sorry to bother and thanks for the follow up!

Dave

> On Feb 7, 2024, at 10:29=E2=80=AFAM, Mathieu Poirier =
<mathieu.poirier@linaro.org> wrote:
>=20
> Hi David,
>=20
> On Mon, Feb 05, 2024 at 09:35:41AM -0600, David Hess wrote:
>> [ resending as plaintext so it makes it to the list ]
>>=20
>> Experienced this kernel panic when stopping a coprocessor while the =
RPMsg tty was still open and being written too:
>>=20
>> [25016.237134] Unable to handle kernel paging request at virtual =
address ffff800015b3a002
>> [25016.245244] Mem abort info:
>> [25016.248053]   ESR =3D 0x0000000096000007
>> [25016.251824]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>> [25016.257140]   SET =3D 0, FnV =3D 0
>> [25016.260216]   EA =3D 0, S1PTW =3D 0
>> [25016.263363]   FSC =3D 0x07: level 3 translation fault
>> [25016.268242] Data abort info:
>> [25016.271147]   ISV =3D 0, ISS =3D 0x00000007
>> [25016.274991]   CM =3D 0, WnR =3D 0
>> [25016.277960] swapper pgtable: 4k pages, 48-bit VAs, =
pgdp=3D0000000049c2d000
>> [25016.284680] [ffff800015b3a002] pgd=3D10000000bffff003, =
p4d=3D10000000bffff003, pud=3D10000000bfffe003, pmd=3D1000000075692003, =
pte=3D0000000000000000
>> [25016.297273] Internal error: Oops: 96000007 [#1] PREEMPT SMP
>> [25016.302859] Modules linked in: rpmsg_ctrl rpmsg_char imx_rpmsg_tty =
xt_nat xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink =
nfnetlink xfrm_user iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 libcrc32c xt_addrtype iptable_filter ip_tables x_tables =
br_netfilter bridge stp llc mwifiex_sdio mwifiex bnep overlay cfg80211 =
mcp251xfd can_dev cm
>> [25016.356332] CPU: 1 PID: 95780 Comm: python Tainted: G           O  =
    5.15.129-6.4.0+git.67c3153d20ff #1-TorizonCore
>> [25016.366955] Hardware name: Toradex Verdin iMX8M Mini WB on Yavia =
Board (DT)
>> [25016.373924] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
>> [25016.380891] pc : virtqueue_get_buf_ctx_split+0x28/0x180
>> [25016.386132] lr : virtqueue_get_buf+0x30/0x40
>> [25016.390411] sp : ffff800015db3a80
>> [25016.393727] x29: ffff800015db3a80 x28: ffff80000a7022a0 x27: =
0000000000000007
>> [25016.400870] x26: ffff0000077dec00 x25: ffff00000e76c0c0 x24: =
ffff00000709bf00
>> [25016.408015] x23: 0000000000000007 x22: 0000000000000100 x21: =
ffff0000014e1f40
>> [25016.415162] x20: ffff0000014e1f00 x19: ffff000006c3cd00 x18: =
0000000000000000
>> [25016.422306] x17: 0000000000000000 x16: 0000000000000000 x15: =
0000ffffa5db3fb0
>> [25016.429452] x14: 0000000000000000 x13: 0000000000000000 x12: =
0000000000000000
>> [25016.436596] x11: 0000000000000000 x10: 0000000000000000 x9 : =
ffff800015db3eb0
>> [25016.443742] x8 : 0000000000000000 x7 : 0000000000000000 x6 : =
ffff0000075c6e40
>> [25016.450888] x5 : 0000000000000001 x4 : ffff800015db3ae0 x3 : =
ffff0000014e1f40
>> [25016.458033] x2 : 0000000000000000 x1 : 00000000000002cf x0 : =
ffff800015b3a000
>> [25016.465182] Call trace:
>> [25016.467631]  virtqueue_get_buf_ctx_split+0x28/0x180
>> [25016.472515]  virtqueue_get_buf+0x30/0x40
>> [25016.476441]  rpmsg_send_offchannel_raw+0x44c/0x4f0
>> [25016.481240]  virtio_rpmsg_send+0x28/0x34
>> [25016.485167]  rpmsg_send+0x20/0x40
>> [25016.488488]  rpmsgtty_write+0x54/0xb0 [imx_rpmsg_tty]
>=20
> I can't find either rpmsgtty_write() or imx_rpmsg_tty() in the kernel =
tree - is this
> code public?
>=20
>> [25016.493551]  n_tty_write+0x2c0/0x48c
>> [25016.497134]  file_tty_write.constprop.0+0x130/0x294
>> [25016.502016]  tty_write+0x14/0x20
>> [25016.505248]  new_sync_write+0xec/0x18c
>> [25016.509004]  vfs_write+0x24c/0x2b0
>> [25016.512409]  ksys_write+0x6c/0x100
>> [25016.515817]  __arm64_sys_write+0x1c/0x30
>> [25016.519744]  invoke_syscall+0x48/0x114
>> [25016.523499]  el0_svc_common.constprop.0+0xd4/0xfc
>> [25016.528209]  do_el0_svc+0x28/0xa0
>> [25016.531526]  el0_svc+0x28/0x80
>> [25016.534589]  el0t_64_sync_handler+0xa4/0x130
>> [25016.538863]  el0t_64_sync+0x1a0/0x1a4
>> [25016.542533] Code: 35000700 f9403660 aa0103e4 79409261 (79400400)=20=

>> [25016.548634] ---[ end trace bc845368ab15e73f ]---
>> [25016.553257] Kernel panic - not syncing: Oops: Fatal exception
>> [25016.559009] SMP: stopping secondary CPUs
>> [25016.563249] Kernel Offset: disabled
>> [25016.566739] CPU features: 0x0,00002001,20000846
>> [25016.571276] Memory Limit: none                                     =
                                                                         =
                [25016.574336] Rebooting in 5 seconds..=20
>>=20
>> I think the simple and obvious answer is =E2=80=9Cdon=E2=80=99t do =
that=E2=80=9D - we should be able to safely ensure the RPMsg TTY is =
closed before attempting to stop the coprocessor. However, it would be =
nice if the driver handled this situation safely regardless.
>>=20
>> This was experienced under the TorizonCore 6.4 distribution on a =
Toradex Verdin iMX8M Mini WB on Yavia Board with this kernel:
>>=20
>> 5.15.129-6.4.0+git.67c3153d20ff #1-TorizonCore SMP PREEMPT Wed Sep 27 =
12:30:36 UTC 2023
>>=20
>> Happy to provide more information as needed. In terms of recreating, =
I think it=E2=80=99s as simple as opening the RPMsg TTY (with receptive =
firmware running on the coprocessor), writing to it at a high frequency =
and then stopping the coprocessor until it happens. We=E2=80=99ve seen =
this panic a few times and eventually managed to capture this panic log.
>>=20
>> Dave
>>=20
>> --
>> David K. Hess
>> Founder, Data Bakery | Data-Bakery.com
>> dhess@data-bakery.com | LinkedIn
>> +1 214-684-5448
>>=20

--
David K. Hess
Founder, Data Bakery | Data-Bakery.com
dhess@data-bakery.com | LinkedIn
+1 214-684-5448

