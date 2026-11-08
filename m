Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168535;
	b=sLGv9KOyGMotPpgt+4taeZUCAsuFVnloilkM1q/qaQ0cIrSDRhBJqQSYrK8dKT81QQhL
	 dWcF8pN1EeLJrYKslAvP1WJdkij6eyyDUTT9060wWuHLUF1fXFt3Y8ZDQEUqbgMZ2n3rS
	 6R7mWWgtKrBMK1tLGxpuxYwwaUNVlIVK3WSh++tIg2+AjnLBPGinZENvLTnpr2fMtT+wY
	 iz2/FKGN3ms5s9KnvDKI4qFKoDUulYn9RFXhJFmHwDhuigntyYkRqV3sfC9ndwJWD+8Mz
	 c97DRE2BcbVrLalatV1lJ6wO9CxXxgrePutC29QFQl1b8ZPQ0YZVkw9EvO2JTr3yrng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168535;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1lcvtkDRUH7x5RzUrkH7YPRWwzWwwl5C53b3f6vIGq8=;
	b=4MXNgNGkfkoITqPPNXCFR8LEZHk8P9J8zxNWfQ6Mb2+Ya5UuH9fn3fZQOa8hhxD4Av7j
	 swK5hyg/rolsoSygs4o56wRgA7tFEQpUGL7P9hQTA6/ak0GmGXmrtit5GNtzAhkUEqKik
	 PrOU6t2MdOTbtxoDVofHJTrdoIKqCGqHbFCDX7yUzqQrVnt0xOfLR7Co5hIYOxVWGKp4T
	 J2o/UCQX40EyXKSuseFqq/+eGA6wzFWlpuo7SZB+D9nWWz63+BwkpmKdpJPm9AgpCSneX
	 1EedR0vw0xUgr5IBh6UmbiLjZ66aX7doRvc1K4yscQLloSeTqRCy8RqV3XFmREF2fog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThDgVmKa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B5D606D81E;
	Sun,  8 Nov 2026 20:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThDgVmKa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508EF1F008A7;
	Sun,  8 Nov 2026 20:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794168534;
	bh=1lcvtkDRUH7x5RzUrkH7YPRWwzWwwl5C53b3f6vIGq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ThDgVmKaxZo8O1L21LnEcfkcSAQ2PX1b2X/TMdo1UMh+lT5UNhNFsKDRKzrjvYYZ0
	 f9azYR29OXMZczh2n0ktQ5tllNluL71YsQM9WVbt7gv0WBGQIXZlUK1JRc/XXG9967
	 FaPeF4zZ1Mzovw34ReIKJM3MbmFUdrfNpucTF5Le4ZfnPoVHye+2appslj8U64pdCn
	 BxZFyw9USlelALgoCG2j9TAQN0xLw28n8Lj0xfYI4Xid9+tdWid/RrMDl11J+1Y0NN
	 vV4tOk4pqYtg3s6ylhe/IO2ebn9K4SFxP0mXzSI0pwsleLl7cGeqnZ/mZRVMoVOWe6
	 uqhm6tk6tH9WA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: convert to subsys_platform_driver()
Date: Sun,  8 Nov 2026 14:08:41 -0600
Message-ID: <179416851782.24425.1520809512802021104.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
References: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
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


On Fri, 06 Nov 2026 19:31:12 -0500, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> 

Applied, thanks!

[1/1] rpmsg: qcom_glink_rpm: convert to subsys_platform_driver()
      commit: 64190e85ddb9572d27e73d5c02f43ac3c776f865

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
