Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606893;
	b=OrEWXOp6zoUteYnPoF4gm8Iqn94TzLjq1SKqlK+XJzrq3Uh4WecBT1M1FXtF7YMk7+sg
	 Mw4X76oV5EHaz1ORswN1Eii4VuqPjLFiQwkIbUW3E/C8NhI6ISCOt4NGRn2jmSY8qsIlo
	 M8ka/S1E+t2xogFfH8cTrgnaXIoHBF655dTi/qVuN2Z82+pb6N+LYSFIL7OKdETHB47MZ
	 adAF+lpZLqbnx6NsR5SYuU6yOTL4oh2iq7XkFTXQKUoM6QECp4LhtrIy28blqrNu3fo+I
	 cT+dbrZkU3M8jRig2SqVD1RRwsKFX4axXuMzedKm3z321GkM4AnYJ+NNoI5o33PVyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606893;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YxYvxkiTr3I4fwI/607mbu2WA82tAeXABlzoiYL5+2M=;
	b=lc5XWAesgG5au7ZE2NWt54cmm8v7uIibwh71SOCzNGJdAtm/0nTaF600RjcC723ZckBK
	 fEvvym7loZN/cftf/8gPjeCH8iRyDEHs5Fd53Sx3aPmJdbs1p9MQxz4nQHsXy/d2V5cy3
	 4bDyLLJw40dgfAHCvwOrAsvirvCzqbUVoAojkVJvoCygCs2YACPN6ZakYhOZvG3CP6SIe
	 S7xoawj9zI8sGLjGbdBp7cgfL2OCTPEw0DKtQyhaKLM9TIn2YNkiDY3M+1GpS6bt3Y/ZP
	 UhfyodFdI5WmfpSwqrU8IhQm8aCfelRAO3MPPUWcl672v9/rwMZ9R10wVYtWM+TNYpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIw4RN+w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94051606A333;
	Fri, 13 Nov 2026 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIw4RN+w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C996B1F000C4;
	Fri, 13 Nov 2026 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606893;
	bh=YxYvxkiTr3I4fwI/607mbu2WA82tAeXABlzoiYL5+2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KIw4RN+w49C6lIdh2OA9wim+vaxIboICMvGfKhMz3Fbixhzp9ZQgQ33Li1sLiJt/j
	 L6G84IrPlusWhqk4Z1pkyfm+Msji6bcw7r3zUW/Qbv5Fjnsf5+k2qtqDA008O0sBYG
	 yFqVz3UeDBHdT7yl7h8rbNbERlf81oKYklGGgOAyXPs+8JnuQ4zh86uNOoAS5wL5fs
	 d3O/RBaKn29it/6x/AAu1Ca7miaSMEXNRLku/CBUp0VU4BG5+GXlQ+yWOhaOPbEofy
	 tWzDV9jd/EqpIxGCh59rYUkd0dvTCRej4QyaQ8EvXwNQOaeU6irlhseg0Sb4QxKgTn
	 FSVGK5Fl0XLbA==
Message-ID: <79141341-b259-433a-9656-286f5b2fb62f@kernel.org>
Date: Fri, 13 Nov 2026 13:54:48 -0800
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] wifi: ath12k: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-8-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20261113185009.157893-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/2026 10:50 AM, Mukesh Ojha wrote:
> ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace qcom_mdt_load() with qcom_pas_context_init() +
> qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
> qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
> qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
> retains qcom_mdt_load_no_init() with the caller-provided mem_region.
> 
> Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
> consistency.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org>

