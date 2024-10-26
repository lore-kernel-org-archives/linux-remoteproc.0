Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939E1FC3
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Oct 2024 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729940227; cv=none; b=LmEFeV4pjLvGGFMkZZ8N4PM5RhATXKm2yaak3iF0WAnZQMfxgPmXxy9jfWk3CXeSdvajGSDLftYBd0WyMNA1J8VvLuf61KtgZueuSqmfxNdk3vsbtR+eyde8HlHdIoosyd46/4XOEJgRsqVFxVV0bLkLshTuPIvYiOXgOuaxfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729940227; c=relaxed/simple;
	bh=JUgk6cDnlB7Nr3Qts8s8cuqgci9W1lxa/PNvUO7OJ4E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzwW3vfkTz3ykr4i5f2/7+h6EKJ9O3fVSPhT8iWXFG9NV7tpNNsnien1XLLVjAcGsYZP2FaA3DIYZJ9EwzTpRAkcBRcDSrx/tBJWi64nVjFrG440Ouda4raxr2SaDzeUIZYnVQBtkQ++sNj5mQuzp+H1dVTFdOd5Jl6dHXd3eSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=felix-kuhlmann@gmx.de header.b=rMR0DIiy; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=felix-kuhlmann@gmx.de header.b="rMR0DIiy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729940222; x=1730545022; i=felix-kuhlmann@gmx.de;
	bh=JUgk6cDnlB7Nr3Qts8s8cuqgci9W1lxa/PNvUO7OJ4E=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=rMR0DIiyCM3zsldUpw/Uesv5EX9/JjbFUWjxq8CUwb028SoR9NnQUmmi53UfHFxp
	 lgJfKnQKhBSY9+EDsONNF90m9Q3GsbXYvkPuY/O3MwdprTaMAATraUB10/c6SvPca
	 5oVLJEYqkI/dQaa3jsVbfV2AMck10IkxGoBnwbTXfT8xO9Edj47/ZBacwj+eCDqcY
	 hv+gr89ausl0PhGV/3LWd1/KIS+QiJrk4ktDeK835ZuG8WYa0/nWFXhkVQXUZfu+u
	 k8O21PJZIEdS03/hDvn13tobk1cM6wIKsJAZnzg1//uxmyKG9cUkL/dryKOEOAzwC
	 46O27CL5VdmqFvAcBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from fedora ([213.172.123.58]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M8QS2-1t0Gkw1qU4-001SiX for
 <linux-remoteproc@vger.kernel.org>; Sat, 26 Oct 2024 12:57:02 +0200
Date: Sat, 26 Oct 2024 12:57:33 +0200
From: Felix Kuhlmann <felix-kuhlmann@gmx.de>
To: linux-remoteproc@vger.kernel.org
Subject: Question regarding optimisation of RPMsg round trip times on Xilinx
 ZynqMP hardware
Message-ID: <ZxzLHcWpjeo9sJGN@fedora>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:bNehmns2ImIFD+G7X7T5urRsA8OQ7LtdJ0iiK7xZoZ1wVOTqVq8
 doiZVlQwp4XX71MQPWxi8iuLz7UsV2sBllnlMPGBg6T58mlLVIGFJtxCHoA17k9WoQEx/j5
 FFcQIu7JKv+2uXuHX4FAe9T9I45d0VG4mrJycPwt7xPFL7KSckBcd8N3OORIs1JATRHJiC2
 u0SYJqjiLlKsQ23Takjcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p1QfBUcSIWk=;JNCwl8ZT7tcWMLe27pUXsmkB5YJ
 EUX4Coa2eQeQZw+8Yx9SnDeQYNzRJNduWvKoq9wrOYfeg/DsFUn3sn8Crme3J1iy2hy9rqCeh
 Bhs2T2MOYr3VgzYsfUga/UK7PaeDiZrb97Vxcnx4QAbTNVwSxzJhRg4hd0OqhV/8ptE5EqcdY
 5yCo0EqHka+9J07/qY4znnHGkkWxthWMf3rSaorMbHFgIeX6GD+aupuLEAyBlsqB2N923tcY9
 ahfZLb7faQO2Opet+M7kok3rMX+c+Fxe8PHhhLIxTk5cEK3O1JLTyCGsUtyV8+c2kz5xRzv4y
 CZESXqNa/5vJON8NQqcKtfLKNM0P28EVZUi/OPQIM3i0UO85X3jfYiZqwuANhkeeBthS824Go
 Y7LKlAWSAG046Vxl3wsbOSS7S6K2lxqA6H2vpszXw8aOO3BhbyveZog8shhVdk9cz356ydAdK
 LoIKmWWkm952OO9h3a507fEL1j1ygLb1IJb8GJr9A6qShkMKfYv7+IBaXxYQiioWWvMrXMygs
 QzUjCgv6Kbt+vJZT1iSPH6oxH8IFNwGiOMnzU7+5bYiyn/9LBvicgrJJWwfYnfd647Mx8dsbj
 fILfZtKlJan7oct3qmQiciNUQxFHKV8MAh7IhvqkkTupWVLOd1dbmVftn0elMDnfzrT+IisiY
 1Fdn8rvDjgjZIS46cjmG5UIzM2G7TYM54jH7u/SAGra9IhdftWRWHKIfHe+jNEW/WWI8Sr/dP
 UlBW35m7RXLPPR2dmKYdPolKPf4DwFW5IGDEeeIQfZySPDvaotltUnKwayxtXF648kzFn7QLI
 zjw6KKryi8go83Tcm9NBi4lw==

Hello everybody,

I need your help concerning an error that was returned while trying to
use the AMD Xilinx implementation of remoteproc. I hope that this is
the right place to ask for help.

I'm currently working on a project that requires Remoteproc and
RPMsg. The hardware I am working with is a Trenz SoM containing a
AMD Zynq UltraScale+ MPSoC, CG variant, DDR3 external RAM and a few
additional components.

One of the targets of the project is that the communication between
the RPU and the APU should happen under soft realtime conditions. The
issue with the communication examples provided by Xilinx is that they
use the external RAM for the buffers for RPMsg. This results in highly
non-deterministic communication delay jitter, which is most likely due
to the fact that DDR RAM is not suited for those applications.

Given that the SoC already has an On-Chip Memory that is designed for such
applications, I am curious whether changing the shared memory location
for RPMsg to reside inside of the OCM of the SoC result in a performance
boost. Do you have any experience with such performance benefits?

I'm currently developing a solution, trying to adopt the examples AMD
provides, but when trying to boot the fw image, Remoteproc complains that
it is unable to allocate the memory, saying the fw image size doesn't
fit the len request. This results in Remoteproc throwing error "-12",
which simply indicates that booting of the RPU failed. More information
isn't logged.

I have tried to read the documentation, but I can't really decide which
aspects I need to bear in mind when trying to adopt my code to use a
different memory region as a whole.

My previous attempts at circumventing this issue failed, resulting in
the error above.
A few of the things I've tried are:
- Changing the shared memory and the vring addresses to be inside of
the OCM
- Adding the OCM and the remoteproc buffers to the device tree
- Attempting to increase the requested carveout for the firmware

I hope this provides a sufficient overview of my situation. If you need
further information or logs in order to figure out what went wrong,
feel free to ask for that.

Thank you in advance and best regards,

Felix Kuhlmann

