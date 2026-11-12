Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487177;
	b=0NNPFRzWUl1De+iOxgUj1cz0/7QOZImT6/JucggOeznoV1JbEFhG4KVQ0Z4Ig9nHmlKs
	 ZwN+Ir7cYD3kdhwKK02B7UFXBCJ4rcQtSo9Dfr7azP3OeDs7BcI7w+t3GpeE/gokrshyq
	 etmnCCur5iYRt7OfbBFyAtZYAB9Ck22zkblmb7m9lpCSTKXafgzHCn0XpZoUURRLchEwB
	 WevQF8iugUOWjfodysSOu9bpSgjXCQ8UZ7k8QMr6yaYEaPq/tnhI0FCUu7AQxMnIQJkq5
	 9dQuhKOOnkAUeitx7J+AvaMLPkvWAQmO7yHeGHS0MGknqsG40PaVZlwc7KvioATvR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487177;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=yMmxarvKuWiv+WJ1CqNuRGI1KSUa+Lm1q8SmhMUX8lU=;
	b=1ElE20RfMS/V38wP9/qQmGmov4RnyhiVnPWVzmyWpNvcd1PQkq1yuuAmZPc3yZsax8Dw
	 +o7odpRCoEF7H34q/jOjajJxXDZ9EbWm1czN8Kd4sbVR3g87V5xRBaQC/m7jychr0kU0O
	 sto/Rey+dJgSKhpZxcJFBXL8VIkJuJF2flF2rMgQ7wsduIy7p0+9nHK0E7pYZiKCM6kHW
	 dH3JqCoVVWZDWBnq9U5/Iypn+4hBdXomoYpwLi/JKbmaQA6+dQgzH6wOjSe6BYRlbSZsf
	 O8X/MYMbzSq58PZNLB4gBtBOdpzQ5OYe1IawmL1LakaGq8RarMWogsAwLgcxHVOObcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=vJR3YkF5;
	arc=none smtp.remote-ip=198.54.127.131
Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5192606A32D
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 12:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5192606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=vJR3YkF5
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jQKhP0k4Cz2x9D;
	Thu, 12 Nov 2026 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794487159;
	bh=yMmxarvKuWiv+WJ1CqNuRGI1KSUa+Lm1q8SmhMUX8lU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJR3YkF5bhk0HfnpjN4X1uIyuXHSY59/DLOW+M/p6YCYDKOFtxd2Tr1K8C45fRlWD
	 WlsCkxdSwsCpTS51SWkMKbA4rEpu2vW4HYraaaf66N47zHOQ4KhkRy7fhkEFKoiJuA
	 N/MKlbpmY8QN9yPoLVPIJILGewvzcDUPUwHmABNowHeFktDoq2G29w2lbeOABz+Y3P
	 JCVfNHEnDMkeiFCcS7iw1MVF9zb1MquYMfv14VIKZE0UBX38L9qsqU11dEiy1vuMRh
	 KI9kaXU4K2T8g+M3l135BMmf9pXEIz/Z9d3jOSGHkYd9awNPYfVPVUEuOzt7dd6Rar
	 8hvjqUcfQKf4w==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: francesco@valla.it
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Thu, 12 Nov 2026 15:39:05 +0300
Message-ID: <20261112123905.2877732-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avTnp6EDSU-0BL_u@bywater>
References: <avTnp6EDSU-0BL_u@bywater>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

Hi Francesco,

On Wed, Nov 11, 2026 at 11:21:58PM +0100, Francesco Valla wrote:
> Since rproc_report_crash() is already logging the crash detection (also
> printing the name of the rproc), maybe this print can be removed?

Agreed, I will drop it in v2. I will send v2 once you have finished
testing.

Thanks,
Chrispine
