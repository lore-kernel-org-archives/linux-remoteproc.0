Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679342882CD
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289225; cv=none; b=qMvW/KEDJuxHZr/qPP2C8biGAz3NF2SXeR+1aqvNjzfRk8DSCliMoflwpOGlN0fNtHh33yxtJ4WCwf5c/2jN5SptazmKpoCOl0ksLDQdogKk/iZMR4zMj9VNiNLPNitilN8BOBQ4FKGAZ0XaI9c8UBzZZTRnzfhUfDZrSOleteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289225; c=relaxed/simple;
	bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exBRaW/ZuMFr9OJbnTZ8zg3JZZSyNKcEgzpc0Nhx9/PmLIRxpg9G9S2zzG1haOvMq7vU+O23TZTUktJk53gJUfuCRjUFeygS8defLEMnSJhTKs7bPy3GfDdzD2NkfeOe/A8uvBanuC4M/MNvO6c9BZZ+7VCfQenWMVOMMmX9Sew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/TOp374; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/TOp374"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aad4823079so5152802b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 06:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289223; x=1765894023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
        b=m/TOp374/W3/y9R9uerhygn+G6XjlldPLciBC2a9JLZWKE4sozOtX4oQ3uD3gurO5B
         Sah2Ry7BeJWOTSlu8ZKtFcuRQPfNpBc/hGAjxCSQqAEmC7IOQUz/LonDgz96q/wRtRd3
         ah9N91yEHB7ogR2EgEVDGa56xKMlVXqnY5h42E8wcJyEnxbWEtOBvDWNUMD9plC0sdv2
         nt01oqWYuA408SWF1nhC/zZKwQQ54ld+rGKzLqIev5ouAxjmYdOLKwrQOjnjHG8NJTTM
         tK9Xc0jgz/DwliRv2ifLEMRRe36tDVrgKOXgjgV+fiL74FebTt4avN920XvXwKQq/Jmu
         U97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289224; x=1765894024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
        b=urIfCYsXBHmZcvFuIJ6lLKVl4d953Jlsr/bJ3l726E3uNi0TOGUagzK1g3EiXNyH9t
         nLPAOK9lXBfk9Kty98ZNyNXqratMbjXP23G7B8VP69pyIMQP4GfwlCG9WS/iaJPogbvv
         cofLUni7glHNKRo5uHzX2Mw7NiWVuFTL/fx4mroYnpMlm9jxNdBZYUmhxOBOo2oFoVeL
         QTSafAILHx27gqlMaZjAK3byVntNwVk7UqegM8vUHc82BDsLN2bwfeH5GD6YcEacWE2W
         zgU63oZOWviAj0/zhvmgPyM5I9Bg+h+Wz5hrrCEoYiTgBh0k8PKBbDwj92S1SucpOXKq
         HvDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyZ2+tLWOA0HIkF31Vuffehk9Dpc5AcFeKVNbNInTMHNOXEqgxcQskUv45dk6a9OcW/muOLFDe55n14nVWtD5c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy53TuThLrtKtlNUOjL8QoTnUPNI6aR1dT1a3izoL9imIFlx7Z
	To7DspUShUWsb+blKszxgw8YyIRzqFIeyTffuCVE4vvzK+cFydsyniJTDs96lAudLRfignnHbyS
	Q4p93DDLaUlqwLgYQO0S4h0BNOl6+PrE=
X-Gm-Gg: ASbGncskuoZv6q9VT7O9mnq1i9osZDmerXfMWAIuvPj9lkwqzvcQcQy8Px3zy9opvaz
	kF2f098p+Rtu7fy+lNAHZ2EOpVkSnoVKSymxKO2w3ZTm0E/9p9qiNMJaYjQUignjb5Wuo4BdHk9
	778smnL3fsAE7jLxHnzRVfwlRQ/tn3Ib6ul+FfRUTjUVMs+1ST73liDD+M2lCcRn3b9YpClJ9Mu
	RIozTsBLbv6D3VmE7c/VAU/FIeiEcAfOTF3HqoxPKQkBIZV8ZG3UjaIIThPamcEJu6AmTaE5cPL
	mDKHDFFqSvOTt4EfliiTdKi7+OCiprpGkcVetlciC92DhXPN8FpPkNLqPo5YNPyaQMCvJvtsweU
	MBiQcRsvCdw==
X-Google-Smtp-Source: AGHT+IF5qKkipCzYEFzejnBb5df6vSYSFDP3s5q/B01Pgp/zxcwgrfIpRlHh7JiFs/tuo4o8rJk2zzjfEIRdHLWLt+o=
X-Received: by 2002:a05:7022:4388:b0:11d:fc64:9562 with SMTP id
 a92af1059eb24-11e0315ee8bmr7976330c88.1.1765289223387; Tue, 09 Dec 2025
 06:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:09:30 +0200
X-Gm-Features: AQt7F2oWIRtUxYk-A63rfaiqGIFxA7_EkG0XNavFrSy6-Iw6Vp4fAIgO0gAu08g
Message-ID: <CAEnQRZCPX-enWtWYXM1KD95=bTD5-i46L2Bej7gXP+mggCUwPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Firmwares that do not use mailbox communication (e.g., the hello_world
> sample) leave priv->tx_ch as NULL. The current suspend logic
> unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
>
> Detect the no_mailboxes case early and skip sending the suspend
> message. Instead, proceed directly to the runtime PM suspend path,
> which is the correct behavior for firmwares that cannot respond to
> mailbox requests.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
