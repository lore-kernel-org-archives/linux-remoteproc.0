Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491701;
	b=Urc5H5yl5ewZ3B+HZW8VSQrO1YKizBJg088L8DV+4TXTW7C91wsXxgZ0D/JR9AnfGZNz
	 jyN4EeDC+6UD9GdpOsaF+dFXzgZGMWQATHL5ALY6MKhl2k8HKj3RqvREmwJjQQrMGm/v7
	 peOy2kacSN2+TSn0BaxA4g+bJrhPZB10V48qaR4CnClj9cnWuoFf8AUp/1sMOwMBnmA7Q
	 I+2cYNzSlE/plqne1w2dClBqVWbZzmB9iqywcli6iAmMp7EokJUKt3RBpTAR7QkGAfekn
	 wrILg6pf/9fMHfv2DjsyVIWfoUZJJK5rZnTQqJssNcnnb2RQzAMHmTO0J6F9d1w3mew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491701;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wQwgRoGgYHWQ1A8qIp9coOv5y/TDPsmgjwoTZvOdYAQ=;
	b=TvghNU4bIlrikFrvCzgDqZO8mQUEsKnxpKdpnSRMjcXR/N6ImMPZneSgQV630ZcnrR0u
	 i/QjHkmboH6Y+QFdgErJ3NkG4H/Up6kNlFZlyKEmFhbTjJaeUu6A/ePq2lcGztH9EPB3O
	 qCO+NAPRGM4MDkaonXnHtLxiOw4aPXwQ5zax6lyJB7mipgaop3BFADueeGKnZIFtZ0vQ9
	 O2UxbV6YyQk15G9VOp55YO5KDtVekO94S6FB0IG/eeDAMm8aRdajbKJCk/D10G3iaw6Eb
	 5rrXxnr6KlLo+LWT7r+Pzc58vwqz5WDY7rDa8Ku+kmmPE1wfeCdNH10et3MpRPE14nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nUhnHM8q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9C606A327;
	Thu, 12 Nov 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nUhnHM8q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7784C1F00A05;
	Thu, 12 Nov 2026 13:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491700;
	bh=wQwgRoGgYHWQ1A8qIp9coOv5y/TDPsmgjwoTZvOdYAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUhnHM8qKRV1O93+CQs3m1UG4iooIkpRqjhT7sttN3lRYS7Rea8nVkAddEiaAJmyZ
	 DbyZRqeU1gJWNH3Qd4rESBuoB9iIxCzLj4w6oTtixG6XYvt6jyvXwdZReWWqtwo9UO
	 aKw4Y1E6/6V3/Vm+E45f7KXspHmDtx9b/sfeoDLUqslhISUAAAohgGlsyUbPyN7/zr
	 DuPKzB4oqpzrkQU40s7J8ZhQZoDznsiUnijZshXmJDhh2XeMH8EwMNWDtasxZLn0Bb
	 C7kA0S5Uo40wSG49oCm2TheaRETADE1Wvb8/0SIM0eQDGlrj5zwC+sTNHE+tL6soJb
	 4jTWSfGEFkeuA==
Date: Thu, 12 Nov 2026 07:54:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, m-chawdhry@ti.com,
	linux-remoteproc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, simona.toaca@nxp.com,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Suman Anna <s-anna@ti.com>, daniel.baluta@gmail.com,
	goledhruva@gmail.com
Subject: Re: [PATCH v2] dt-bindings: remoteproc: ti,keystone-rproc: Convert
 to DT schema
Message-ID: <179449169755.340135.1858110679427620923.robh@kernel.org>
References: <20261029-ti-keystone-rproc-v2-1-7fac1d72f4b3@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-ti-keystone-rproc-v2-1-7fac1d72f4b3@gmail.com>


On Thu, 29 Oct 2026 04:47:18 +0530, Bhargav Joshi wrote:
> Convert TI Keystone DSP remoteproc binding from legacy text format to DT
> schema. No functional changes are introduced during conversion.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - Removed unnecessary refferences.
> - Rebased to latest mainline.
> - Link to v1: https://lore.kernel.org/r/20261006-ti-keystone-rproc-v1-1-41f7f078b44e@gmail.com
> ---
>  .../bindings/remoteproc/ti,keystone-rproc.txt      | 182 ---------------------
>  .../bindings/remoteproc/ti,keystone-rproc.yaml     | 126 ++++++++++++++
>  2 files changed, 126 insertions(+), 182 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

