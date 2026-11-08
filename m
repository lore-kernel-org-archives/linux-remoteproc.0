Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168534;
	b=T5ls1MjA8goI/Q/9MjVrcozKlH9DNupkrvLK4wsqvKi0Lpk3eBtgJfqxsHwK7rd4CBnO
	 gpLqF5ku7cNi2vW0DgLNUbxfp/d9NTOapareAFNiUOorX0d78V8VpaZmS/Dh52/6rBQHp
	 aJLTttcNy5C2Jm9ByqwbnvLSdlYPEj2NENFgtbO5vRi7JsRkE/GIzA0DylQLiZboLc9r4
	 xkU1Seg1I4vNwkyIjSE7geMtsLtp8Ek204024RQPfOWULJIN+PxpE562doJXi2qb0b8l6
	 ftKGubGJbLHGRTcmKgrhhlGYentb/nLfToqQiPsM4w6TQv33PD3CCIaZUdmlNcgJQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168534;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8NKoT+1EtpIVBAKVaHscTHXwJmEtQT4YWB42HDKGscM=;
	b=qCFF6DtuOjfHTu5FgZqcLpARw9scYGaCSkrIx4blzMFTSjJlVHQ4rgf9gyQ3+HgVuRCb
	 DNIiF9kuZQ6PIofzPS5n8gc+tR9Iu4F9gFlFnf91yJBpJo1qHgF0yz6nerm7E0mpY39KI
	 ZJ9t67o5O3uXoTH2QFfNyYwa+5mIDjRTPuMAXqxy45xqRwaxWBMQzCd1/zvKcqGvssoLl
	 0pVh9gwHgBRHdVf2Qo4eDV3CP62xxKpMBzF8/737F9MeRM/RE5vN+Vo82Wt2d7ipL2jRx
	 emjfmYEG4GjErjin3WSZ9pg5Dhm2VSw09V3Aut3tyMngSc6XUy9klW39m8zmF6bozeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4nKoeMf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67275606D809;
	Sun,  8 Nov 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4nKoeMf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6501F008AB;
	Sun,  8 Nov 2026 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794168534;
	bh=8NKoT+1EtpIVBAKVaHscTHXwJmEtQT4YWB42HDKGscM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L4nKoeMfz2/5aWB3iUdoNuebwDaL8mQWOSGqyBtYua9Iidv0yb4wMD68x5UJutTZl
	 qC88MGzU06GT953oxxYRskDwJapYCXzhumxIVUYlycC2VcbapPFsLaVc7XtNAqvtwX
	 V/urqAvyuufSdSgLGLeg2C7/ZHkFgOOu2H8PqHut2P9PqfNg1BCiALxp0w/8mQm825
	 JC7HfTB07mI6Gl1gRWes/UyI6rgaPyjyTmoJvaMF0BaVUE3zg3GNI0KD2t0TVZOiNO
	 LX8Q4PgTaZ6UaolLupBMwZabHZtMUXqC8xTkV1hqk5kZTJ3PmWMwdfQU+C+1fG3GZB
	 4SA7nTKWyAIBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in init_mem
Date: Sun,  8 Nov 2026 14:08:40 -0600
Message-ID: <179416851784.24425.11516358740183675684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
References: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
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


On Fri, 06 Nov 2026 23:15:50 +0530, Anup Vishwakarma wrote:
> q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
> (index 1) properties with of_parse_phandle_with_fixed_args(), which
> takes a reference on the returned device-tree node. The two blocks
> copy the integer arguments and never release the node, unlike the
> other parse blocks in the function, which call of_node_put() once the
> node is no longer needed.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: Release OF node references in init_mem
      commit: dfcd5046c3b434107c72f21fc32d6226bf281f4a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
