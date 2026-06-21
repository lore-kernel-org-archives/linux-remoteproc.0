Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8612D21B;
	Sun, 21 Jun 2026 00:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782003479; cv=none; b=FSfVciQIhaGm8JQYX7Wq7W4rECUbFYy8J174blbbGEMHE5BFeuhfcd0QdEOjGLNoUTH1EIPPD1uiw0xhBQzZ0tDlZ/Rbopx1HB5Nff4AaPQJVHDshFqmudQtWrciVSvxRqVVQVtxTDrCUhaTJgeg65tBySEiFoPuQZxpBwyD6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782003479; c=relaxed/simple;
	bh=+9PfwObQCyST+sXI+IfNHwvVSpfLuhewPCMaCEAgKLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9nf+ZfiY/ZgGmTUX670/SkziKnxC8hEjuN7QAnsXT17n+2Du82dwCwlfdQziENv55CdTp2KvDtGF1lXDGuRbo7rGBd/5j5iyk9vBBdhWb+/QUgFVmNbqgSuq8CrlOx6FmC5BC0DG2pmYt4qlNV1M0rIhbyIuxfLVyRt4Pl15hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AV6KiVcb; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="AV6KiVcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782003467; bh=eMV+W7vgCAKKGw5Uoo4X0WpH1HDGBeTIwg7mvA9X+6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AV6KiVcbCpHNLyq6lpI/k7swKfyxRM1Az1Jt1MKgGDKT+OqLhFOeAACCTkPTMpIzD
	 ZNOqUTz/xDHo78XeSlLhe6slFW/fi5L2tc9vcjTnkBTAk5p2WUEndFCxwP7DunM/lp
	 FIL3VYZSMuQZhmjdxiXNamdSNThYclRaJnVB2P5U=
Received: from [192.168.1.100] ([218.106.117.236])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id E6CB62BC; Sun, 21 Jun 2026 08:57:44 +0800
X-QQ-mid: xmsmtpt1782003464t0na5jf9u
Message-ID: <tencent_53F3322FDEB2E45D6412C427B8D1C6081407@qq.com>
X-QQ-XMAILINFO: OE9RT5xy9hGHu+ejjvsIK95pdjh03R8bJZvNjm7918ySgqX+G0EivoV0qRO56d
	 tgVmyd66eN3XVpeqxuFAuFJYi8U4DMu7Hxtpg0zcYEEFVRXfscjY2ZeutOXPt2qqa8DrHypDyBd3
	 60GEept3iWxuJJ+8fPFRZu381JKnl1rW2dT5zKMUGoPK86nwLCbWnqBNBfe3X523q8+BCq+GIw7V
	 fhK6I5w6aUz7fG76gKx1FnxyNewKgHLYOTxMswzFeo2f4f5jTNWzEZiuPMFX6YIPlHO3AEfvnguL
	 3KvQ9MmwNWvblWIDM0yNU9A28xoItjA9oik/QIdrDRBoHV/c8/7sv/vaoErUupzDRsnliflVa2ZC
	 CjI/rhHqc5Ywj1tHLm5Nes2f5R7HkvbCeF/ml1RVpDBxTrUrqDG7EbQzoVqKy+IJl+x49HNFCO6P
	 S9h9Jt4VcMyEsMvc4oB2JCGptJ1pfFOMVVhqK89KWWjjyIOyKz37Ix3bV/At4LSmy7LtoQ5opS4b
	 7m3q1lLMLpxwmTN92OUiZ4ehxGdqjbO+yAKNUrcFXABxXdJy3FV57NZMEQjANk1iMU5igPl/m71s
	 siL84485cYKo+mCn/Pb0JaMXxJGytn7OPADMlrRl3tEhMRreyDuDBxvU5TYAWy3ZIIjcmAIXk1lb
	 4ZXXx2yoxNeTFUSSUdMsjzFoisZKS0bbS/aTlJs2Vmx2QlIIaxUGPUuB1UsQcIUYE36++dWs+gus
	 ZV6LrI/NvJgttvpASrHV0Ci26lAqyqgQJ9vA6qaPlGLkaqMc7Kh1yDYRkEMqCFXK7U4SdY+Z0WZc
	 wahO8ypCk6yagTi9Qp+vjWd+oIu7Jc53Xekv5UjHlRph6aNmoJT5M98K4HzgF5FAqWNowlF+d7OV
	 qg53JoZqEmVCM+iUwwUGClzc9Lq+dQTX7bmMJ+SaGjndg8yQie1mHlbgkVzt9WWfKMuRvDMDcwh9
	 bZP9JtPoKPREIdg/5SbegJKGoI3nqNn0bHXVYjp6SYysqz/Qj9FI0GlFmSc1Lq219JUG9OFxBnfc
	 1omE/M2oFTPtzKoF6vlys48Hs3NaXtpwmkVNzxNnhmlic+n5Xm4gFQtn8DYLnl3m3/aYO6nk1B/i
	 seyp1z
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-OQ-MSGID: <07b2f48f-7195-4bc0-a728-df1381356582@qq.com>
Date: Sun, 21 Jun 2026 08:57:44 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: add SPDX-License-Identifier tag to
 rsc_table.h
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
 <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
From: XIAO WU <xiaowu.417@qq.com>
In-Reply-To: <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

i Mukesh,

I came across a Sashiko AI code review [1] that flagged a pre-existing
integer signedness bug in `rsc_table_for_each_entry()` in
include/linux/rsc_table.h.  The `offset` variable is declared as `int`,
allowing a large unsigned offset value (e.g., 0xFFFFFFF0) to become
negative, bypass the `avail < 0` truncation check due to size_t
promotion, and read from before the resource table buffer.

I was able to reproduce this in QEMU with KASAN by crafting an ELF
firmware image with a malicious resource table offset.

On Wed, Jun 11, 2026 at 11:35:50PM +0530, Mukesh Ojha wrote:
 > remoteproc: fix coding style issues in remoteproc.h
...

The bug is in the `rsc_table_for_each_entry()` macro further down in
rsc_table.h:

```c
for (i = 0; i < table->num; i++) {
     int offset = table->offset[i];       // signed — attacker-controlled
     struct fw_rsc_hdr *hdr = (void *)table + offset;
     int avail = table_sz - offset - sizeof(*hdr);
     ...
     if (avail < 0) { ... }              // bypassed via size_t promotion
```

If `table->offset[i]` is 0xFFFFFFF0, `offset` becomes -16 (signed).
When `avail = table_sz - (-16) - sizeof(*hdr)` is computed, the
negative `offset` is promoted to a large unsigned size_t, making
`avail` overflow to a small positive value.  The `avail < 0` check
passes, and `hdr` points 16 bytes *before* the table buffer.

[Reproduction]

I compiled a fake ELF firmware with phnum=1 and a resource table whose
first offset entry is 0xFFFFFFF0.  Writing "boot" to the remoteproc
sysfs state file triggers the resource parsing path:

   state_store → rproc_boot → rproc_fw_boot → rproc_parse_fw
     → rproc_handle_resources → rsc_table_for_each_entry

[KASAN report — kernel 7.1.0-rc6+, CONFIG_KASAN=y]

   ==================================================================
   BUG: KASAN: slab-out-of-bounds in 
rproc_handle_resources.constprop.0+0x49b/0x510
   Read of size 4 at addr ffff888031283790 by task poc/9573

   The buggy address belongs to the object at ffff8880312837a0
    which belongs to the cache kmalloc-32 of size 32
   The buggy address is located 16 bytes to the left of
    allocated 20-byte region [ffff8880312837a0, ffff8880312837b4)

   Call Trace:
    <TASK>
    dump_stack_lvl+0x116/0x1f0
    print_report+0xcd/0x630
    kasan_report+0xe0/0x110
    rproc_handle_resources.constprop.0+0x49b/0x510
    rproc_boot+0x.../...
    state_store+0x.../...
    dev_attr_store+0x.../...
    sysfs_kf_write+0x.../...
    kernfs_fop_write_iter+0x.../...
    vfs_write+0x.../...
    ksys_write+0x.../...
    do_syscall_64+0xcd/0xf80
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

The crash reads 4 bytes (the hdr->type field) from 16 bytes before the
kmemdup'd resource table buffer.  The value read is 0xCCCCCCCC
(uninitialized kmalloc poison), confirming the negative offset bypassed
all bounds checks.

[1] 
https://sashiko.dev/#/patchset/20260611180550.2442641-3-mukesh.ojha%40oss.qualcomm.com
     (Sashiko AI code review — "Out-of-Bounds Access", Severity: Critical)

Thanks,
XIAOWU


