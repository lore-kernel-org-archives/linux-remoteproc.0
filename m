Received: from mail.maurer.systems (maurer.systems [80.254.189.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAC2B9A4
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jan 2025 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.254.189.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737572025; cv=none; b=ANL27QBWOLpG3XInBRpOKZz0GS7EVRLtpVsMYxb0a7cX+ww7MhxQwbQq2SSvezQq6fN8yy5MhlwpZ/G846O1xYIi2TN1WDngUsnqFUAhFU7nNRnQbARvdtwuya+VissdXOMBvT6J1I5RT08aUHjVTWTWFOn/bna5DvQbw4UsoS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737572025; c=relaxed/simple;
	bh=fFQg0szxZpdk7Nfr/FYbg8Kd9a+RokJC2r64dLtF++k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DPj9pIPxZmxLS2+k+amHMIwrxZa2O3OdOZqmhSYcNmh9G9OasmJWCPEyibt3UNehgv6f7oEqxY8Ah4sD+cwv26Ke+UYrQnFO2c0KeZTHlhwu9RRVJhfmD1tnNOqo10Be4Z3kYguIy5M97nRGdzgGs/A8jBDfWivGMS8C3mr03Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maurer.systems; spf=none smtp.mailfrom=maurer.systems; dkim=pass (2048-bit key) header.d=maurer.systems header.i=@maurer.systems header.b=O3wTJtg8; arc=none smtp.client-ip=80.254.189.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maurer.systems
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=maurer.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maurer.systems header.i=@maurer.systems header.b="O3wTJtg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maurer.systems;
	s=2021; t=1737572018;
	bh=fFQg0szxZpdk7Nfr/FYbg8Kd9a+RokJC2r64dLtF++k=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=O3wTJtg8O1Eg2C/4X5EMtEnJ+oweP9/02pZSU63MJQlOkipt/cMwwuPmTH0bPPgac
	 IURBpi0BxgPvPAp/wCnqkva7QDWWn2S24FLIwwUR5jFUgRGySAVS/LZdNuawBGhmwa
	 soboorY0tAyj5LP93Y0AGeFuniV5WdZlle7bR+mXdqbVu/BktG1gKIUlnKQaSjbpnf
	 neOxT+PEM+1CZiMAUTcOwjWzjNLQsRPLG8gZcPTXpcKkR/YUGAPK+HgnznbkxxiyJI
	 q2xYM1vxCMUVNO1qh52SZ9WrsJWWe53QpdNePbNqVcoz9c+6MYNNvsBEhPVCsYZya/
	 ILsxPv4WbTpsQ==
Received: from [192.168.91.174] (mob-194-230-147-126.cgn.sunrise.net [194.230.147.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.maurer.systems (Postfix) with ESMTPSA id 90EEC48112D
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jan 2025 19:53:38 +0100 (CET)
Message-ID: <1710b217-548c-4eab-a1f1-dd31cd7625e1@maurer.systems>
Date: Wed, 22 Jan 2025 19:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: RemoteProc over PCIe
From: Simon Maurer <mail@maurer.systems>
To: linux-remoteproc@vger.kernel.org
References: <bc9f1dd8-92b1-4839-86c9-ac9e544648ec@maurer.systems>
Content-Language: en-US
In-Reply-To: <bc9f1dd8-92b1-4839-86c9-ac9e544648ec@maurer.systems>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The last patch would be the first step for RemoteProc over PCIe. I use a
Xilinx Zynq 7000 PCIe card as my remote CPU and a x86 PC as the the
host. Both vrings and RPMSG-buffer are in the remote (PCIe-Card) SRAM.
So the RPMSG-buffer isn't actually DMA memory, but the SRAM on the Zynq
is mapped in a PCIe-bar. I'm working now on a patch, that transfers the
ownership of the RPMSG-buffer form virtio_rpmsg_bus to
remoteproc_virtio. So instead of virtio_rpmsg_bus calling
dma_alloc_coherent for buffer allocation, it would call
virtio_get_shm_region to get TX/RX buffers and on rpmsg_remove it would
call virtio_release_shm_regions (new in virtio_config_ops), analogue to
find_vqs/del_vqs.
Thoughts?
