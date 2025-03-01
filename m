Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD528EA
	for <linux-remoteproc@vger.kernel.org>; Sat,  1 Mar 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740818944; cv=none; b=cuJP6UUwc5bC30xsOZqBr07HdyZlgrMNJWyHybLKqNy01t0RHRCaP0aJax55zdhuqvVw1+5PElsNPnWGfqTbFaCvc16MPJ9uNR0D9eelJqgPEdA+ltaBW0jGdN/Ph2ncA2LGR3FIBeKojTv03rslxfGJI848ujHttXC1g77SpoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740818944; c=relaxed/simple;
	bh=tx3NJ3j2ClHrP0zR1G9h5oxfSytvXH75jWztp4n2H5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNUSFsRVDFu9IyJG3hfyCllc2DWbxMboMz/QlWUYenMkM2LCM6Lc9wlBdPwkwZOv8IJmDl4KMwK/oA1Y62IMh+N4tZW6eng7AfkalieCupurqF+cpq2+r8Is4jQAorQHUwuyOx4mxFPU05SbJRW3GQxxxgjYuyFILnX1GsE0z+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=felix-kuhlmann@gmx.de header.b=Oho3Xs+H; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=felix-kuhlmann@gmx.de header.b="Oho3Xs+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1740818935; x=1741423735; i=felix-kuhlmann@gmx.de;
	bh=tx3NJ3j2ClHrP0zR1G9h5oxfSytvXH75jWztp4n2H5I=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Oho3Xs+Hz+EvXvkoVQX6PCM+KBFVkeQUnkRrqYg8Ki6YrupjxDkeGuMphA2cpq9+
	 U5jYcc0f9x9WLby/ld67dsQTsvEXPjIm/6g/E51hECw9c6+pjorRKNQcMxgbE6RlT
	 zcHOk6FEe1liUWepeKY8CYKbD2s03JLIMy1KVQvnqhqU/ksmHtR2nbjF64DUzVYQg
	 jA2VFyGCNiQW3uO7IaZpamZRZfbKAm/evdbkuIH46A+NRBIxiwr5EQ2hsHzT6WzYn
	 TbkZRVEjIOQDXmUUACuB64Rqd4TV4hJfSQORTeXsKHWwOa/iMUN13JRuo70PSRgVS
	 RCN8CFV1OvmtwkXo/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from fedora ([213.172.123.58]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mirna-1tKU0x2xiG-00dBtv; Sat, 01
 Mar 2025 09:48:55 +0100
Date: Sat, 1 Mar 2025 09:49:45 +0100
From: Felix Kuhlmann <felix-kuhlmann@gmx.de>
To: felix-kuhlmann@gmx.de, andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org
Subject: Question regarding AMD Xilinx dt changes
Message-ID: <Z8LKKXJ1DUwGow-E@fedora>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:LHs7neN3z0SXqzcUvEsn675Fo3dEJQXDGxesvPVeOr26Kb1/s8d
 PFAl2MwnbNUvjgcTg56svhscfU1Av8POtoIis3c7xBQjEqDzbFU+eLI44wU5UigUkXulyzc
 mZ9YUvt0fh1fCRBdU0KjfaShEDKnJx/u4/z/c5mZdWgmShoLP3owopP2cocBZV3m+mvc5Qv
 GtsBKLw9B+gz5WuJcuYiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5BvWLhe6PTM=;k12SSAxixKvwW3A8ane37C0tcy2
 pL11/xPOJAuDLVVJ5L4wuP1bt+y/QcOMBLoUXLmkRvCj+NvvLyPENCF+Bv9yGsKveoNGbWHOI
 aZVnDSnskuBxDx2y3x+4HpFF6igQAqtlQsbV8cy2r1bqLjSormVIVY5clWmtkdi5jD2hTCq80
 DHtezxc9W1uBuYmi75NDBIfgerlu4BgM93KaEV3Z+As7VWv7Iptgt/t8bi6wzpaPNArpUPkCh
 U7UHh/eYS5zxA2rznuFHtGSjSvejq/PZAGAeqjodTxlY83nS+tjy9bqeZXvbNX0K6wn6BxBbC
 3cx+3VnhqpNgxLh7sDnk2eF8HEcV87Vw44ga0q1qSUvdmhibCCWjGedML27QuJ3Nct6ZtnLxo
 JfYtyQJkPxAJ1FH7T1h9s1nkfkOntMtO4HfL+yGheuu2INRqLKiXN2WMPsubBjRDL1IJ0MlyK
 1fph+MKqoq3WWz3zJVdRzUAYmzQyBF7MjS+XbiMCTuBYiBeqsrZPWuVlmljK7cKXJpw7kGjFj
 Yp7q+ztX+cQpczWwM4m4rWHl+NMBPekVkEIaxBllehl0Msg/O8az67qtfRi1cKY5G2VnT2P+I
 P5pGh8XjHnhwW4Zw3lQxo4Kpi8nY2cH5ETWWP9+wU6SZuFuRRedXo8AMF9/sxDCKt58kKSNav
 TYxRLA4vQGKi6dEby138hBSCRsTJccZoFXeK+xDG2PUj8JQzpON9XmNpcQnbZcfiVGHnucFjG
 81hPc7xOKKnkKZQzcKw/UmHpt41UBPvVTemH0fru02GIXhxj0ZJuNlnjhgMsl8jGQUdXojlwY
 EsDR6uqB/XZFMKgbtX/fbZmXrmYOP/lNK/E03KlF76vgnao6t+N2ZsQLwuBjuKIyELplFtTq0
 EkbyLf2S4CATQlepM0DvniyRfWIQJPOErcZB3vxLnMGly/9Ta+46m5qz/6//fWQrPfLC9GKao
 b7NhHX1KNR+v1KXmREISOTsnd3DHn/swj80GVsYlp/weMjbWAQ8cps1AaDUTKcRmRwq8MFAn8
 x0gKcyu72KZPhxo8ljcAB+Lbmpnjz0HYXog90pFUX38cIJyUbdEsvceSnZa7xTZ4rKdyfOPFj
 R09bemn9PYPMMh1MAMwOxTPb+8HGbLBC1sonVrhzfGCwoSS312trGmw4l6x0WWqFLy8sEU7Uw
 3k0HSgI6kUBeGoZj2geOgeGd2PCLKXarAxOPOaJyoHFArwpil6wxV56UHNyDdh5h8zzzEk83V
 zAui9z9r8JQUlCJIwLXw86rPdJ9scrG25bTF+JrATFjesLZ0CK0WbRPZaYguRHWyboIzHFeGi
 ZNrKIXu/SIkykFgrGuIwKfX4lPSW4F8ST+NB9KDwHB8Yj26cyzzFDDD4ERkw0KdvEUM971zAl
 cgFh6Xg49KcJqe1OwO6RT5V60hi3jg62Gka6pqzNf9swHkbCk91liWSB4a

Hello everybody,

I have a question about the AMD Xilinx remoteproc driver.
In the past, the remoteproc driver for Xilinx products weren't part of
mainline. To use them, Xilinx required users to use their own fork,
linux-xlnx.

This tree contained the driver necessary for using remoteproc with the
R5 cores on the Zynq-family of devices. I have managed to configure the
device tree of my ZynqMP board so that the driver functions correctly.

This is where the problem lies: I have recently updated the kernel
version to 6.14, using mainline since Xilinx now follows a
"mainline-only" approach. There, I have discovered that the interfaces
inside the driver that get information from the device-tree have changed
significantly. So much in fact, that I have to rewrite the remoteproc
section of my device-tree.

However, there is no updated documentation provided by Xilinx, and with
their most recent documentation, it works on linux-xlnx 5.15, but not on
6.14 with the driver in its current form.

Asking in the AMD help forum rarely yields any usable answer, that's why
wanted to ask you if there is any information present that I have
overlooked thus far.

Looking at the entry under the "Documentation" folder also hasn't
provided me with a satisfying answer, since the driver stopped at random
parts during initialization.

Thank you in advance and kind regards,

Felix

