Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC928EA4F;
	Wed,  4 Jun 2025 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036910; cv=none; b=l1iYbZegW8mzxUYBWm1NiH8uNfr4moKxSc9Q2cMfnbP4s7prmRjRPKzvKdvykNfw3G09/dpXjq0lgUuPWL5TtxhbUiSneJEuSKdFU84Oyw9sV/CzL2JuuPVF91LQDVqt5yVX7Vu6kuRvDxoAVi8Vj9VtvhsNh7vBG5EbBGb64WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036910; c=relaxed/simple;
	bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REzUZ3p4Z1I+TJ6U//25S21s0Wi08z2xX3AhZZ01Bh9jv9ExSGJP7aFN2WDcefIq1bc0+CvjE7mn16KU+HsQ5nYjtr7DVp5ZuscpLTKHxk1Hj6gix34ryhaJfanJvbr/NOgS7FDG/oPl3b/X1VUG2wsmAdA6t41a44Zf7Uk9LIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyS8n5/l; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyS8n5/l"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso5075431a91.3;
        Wed, 04 Jun 2025 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749036908; x=1749641708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
        b=kyS8n5/lFtYIhTAfZj8SKO86ZbmOe1vveEClx6G79N+BpGpfx4T/v9MclbaJfNIitZ
         m5J/7rXMH3pHbn8ZPVunvsxi/o69ArBrlyQWgvl/trAqwmHjkkUzmWJ9KTXElG9iKHEz
         mD96tQCQLtUbZRRMTZ4+xhMuFj4pz6Dpdi/o/z3JhbDiftt2nd9riQTiKveMYq1jPTSc
         jgQtf6/jKhfJPx4Dvu1M/y6st/nsczNpqaWWWJC3qYGciCATdq2N1xsQe+Br86x7A7ob
         eW5zv44y1FAn4RNIR8eT/8Cdp1tdP7vKWq1xok1Q1lEgxSxLcRJYTX+awNJ2qCZ6Y6H7
         biCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749036908; x=1749641708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
        b=MTTMsdi/0hEISF1/HvQCS8j2UyVoLXJO/jT1x0Lr0orrNQDt9NAwb1rUPvOvH1Qjwo
         zkfttrQoQEujCU+ip3XF+lECfDb7q7i5U3AKWNexcVd4xyy7e1xd03qajnl2IwXafQgy
         bXA1UP0EZXUPRpG2AHhzsEYVDawsY5iFyvqq/LB18V9H4mBcH4WaUlR+UyQqzP7fgROW
         7dMzlgmfCrvQaGD9+oFw7CsN9e4oBut+fAMbN4it+km4ExFFZkOaVTgwXxUGKf+ma4oV
         +RcXM4E141DUsrmy+K7AJkZsffgEytrzln5SIjgiu3P+UdEnjHkvAChr/5izLMa6EHi0
         RINw==
X-Forwarded-Encrypted: i=1; AJvYcCU4uVmfyIZ7I9MWw9we7mqGZUTbEDXPF1al8voOiD/a7un9yR5Rhqy950NfyriNx8gOl9wmu1jf74aNg/nVmowVTg==@vger.kernel.org, AJvYcCWq4VLa03IIpLujgkyOPVZxYwDC66qUcKhLWzU+leUgAtk3UfSZNpeIemwWrLqPm9n6CXyPYOYdZ6vv@vger.kernel.org, AJvYcCXGKqfWC7o9qVBsM44WS5cZCzCjJISS9pb4S1as2vH6cN5U4ZxzoJgF9nozxgfF8BUGmVQxNLIisENP9EB7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw67XfbOJhwMbtWlXsbssjOdAOHc9xXGmm3LUitC1t/773xTXzB
	uHo3rYURUyTfmXdWrUaDmO3VjzuyAUVFUqLrnYqtFAzb6KyRu4UXRuN+xLMHQfZ+tvkDsRMs+be
	BNHjyjmuR5TgHVwKDx6BRzxsAB1mYDFE=
X-Gm-Gg: ASbGncu00tRfkOo2SYyA5bNoT1tRMAUn7joYpgSRLBbwXapO+RIOtbI/Jm60h8UJLlK
	6MPrShH8kr9kd4z2EARjkL9jftDzQnEuaYigNezJj5LqGhbT3XoDe0Ebq8SM7YCpBYo1e2KNeUK
	PAnLMXrUlWaONGeJcvpp5gTuMURRxmZA==
X-Google-Smtp-Source: AGHT+IGwIGTmxieNXznAoBW8LEiVl/ryKLqB13xhYIunkErEyJpECY1o6OzL5PMiS9fUTOhNK6TrQ2RtqRozCxKlADg=
X-Received: by 2002:a17:90b:390c:b0:311:a561:86f3 with SMTP id
 98e67ed59e1d1-3130ccf65dcmr3679787a91.6.1749036908156; Wed, 04 Jun 2025
 04:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com> <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 4 Jun 2025 14:37:04 +0300
X-Gm-Features: AX0GCFuTyob7yQ_CjnB1akDwMMdIK7thx9Xx1AgvnXPVg4AWe6fnJ67XkMM0Idc
Message-ID: <CAEnQRZAm_-zr6W4KffXCjzWqBZ2G8TYmMvgF_ABPWhTZNNZGbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: imx_rproc: Add support for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:37=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping
> Add i.MX95 of_device_id entry
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
