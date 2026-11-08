Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169456;
	b=TlFeheaP/dbnZTHnfAWEbtx4oyHmMjDJwJQ9IUXL9ZjN6u7i7K7EMZrN4HoSTFdg3S6s
	 iqzph/K7K/WkoqYQZI6ihj2uT+GZhTAuJip2LVh5Y0Gs3TiUDMdeA/mKt/MZmnEnEox4X
	 1K6bk4NK17tVKnPOkqstX4fSdGUGYPoeJK7TT1unxV337DL1F7rA1obaSjMX2dBX6UD9C
	 A/jpV4PbAztfz1cpTUAnslxPyIn+MpszpEEGkfkuGPH6Pyo67BCmgp2RcpwoCUGy0HpJt
	 V0KoMov8Xe0irPBYfoc956Ll7rEU6duJMtEXy4GediwEYz7Z0uO1T1ZExVJdtws7weQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169456;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uLXYqIKsn+Njyb6tZRijrbk0jj/DcdRQpxrsLcPaeUo=;
	b=wqz704nBJHILAIsOOHTOlsM/rp+OeX/FUUE38P5BhKzFycOchWmKGXXio0wu2LGpj4Fu
	 0lTznD/NoMsCgtZd/sEVEtyr86LC8s7qU//jLY34PBiBrb/h+k7enIQ38o0vctle3dy0+
	 wzbnN/EFjpCI16hQNDU0RiV0rGE0iwSCkrGa4UcQFqvaVjUzWZmhwERsPo6aGyeLT94AA
	 VpNuquRgvX9GyMUNdfmMZ2Ykbb9/Cu5UJW6xDVGHfSM8+QA/BN8WsatTY6AmvQfBts4vg
	 aXfo0AAVcGvSsSjoFz347EtsvhEUSKwjZdYQZGUBxYQIvJOLkQtIDwOjPHssNrLmw0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=np3L+2XH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0C96078A93;
	Sun,  8 Nov 2026 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=np3L+2XH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6773A1F008AB;
	Sun,  8 Nov 2026 20:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169456;
	bh=uLXYqIKsn+Njyb6tZRijrbk0jj/DcdRQpxrsLcPaeUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=np3L+2XHqkSo/OOKHGvjMMXuQYhpwSxdI4rUv6PVFKaNfAgTu4Bo51RCrXbHoQ4zO
	 s37Rg45drEc32sxVF+Kq6WUz4QvOrKMR0zzoKO9rVfNOnMOQdR+tvUhWvOVO0GCDN2
	 9iSRRaCco6UXtbZi3ecIbWytm2xYgJ1ZqScEJzHsArrnmNLxdbQ7R33HlamOKd5U5S
	 rXQRfosFKdHiVdv8vjd65h7IEehPDmMV+aKsVNL7jM1KoEy6j5eUdvdVUpKsABwZIT
	 SaR00PLp9PDAmnP972uA/pwrOnfOsVxj3qiEmhqBlkqZf/4TkFO33pk3EnbXO+uxet
	 xKa0ktL42tTDQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
Date: Sun,  8 Nov 2026 14:20:52 -0600
Message-ID: <179416929266.628393.16013651259190404756.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 22:22:31 +0530, Mukesh Ojha wrote:
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
> 
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This applies
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: pas: Make MDT buffer retention explicit
      commit: 2aa8fafc08e777e9da356307c1a0117e7f4277cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
