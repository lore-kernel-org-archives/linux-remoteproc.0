Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F224A06D
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jul 2025 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349671; cv=none; b=Y2mZCpTbacqZiAXDc1H89VMHVRpGdCUCGf+cs6Wgavy7ptWRf93/FBH/AdBZ9rQE8PkvYt+44BMdWlVTne9JbwnIyAcd0G9xyU+T3DmEsrXiTvc8IZ2ztIGh6bqEEMn3Bu3jRz/eFe4yWSAILVmHIaB/PprtDuq4sNlBkWJicHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349671; c=relaxed/simple;
	bh=5fM4O5mlIBXMh+83kGnKKJzdndRtAsTin43siUV5gCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUDKigvwlj9ovUmYnD7+oiZkbqx06LFfdfhY7fGPlDclNTBFsA4DxhxTXNgdfDzdeVy3TjDoEZf+HB6Qn+FgV4MUOxzGKmQ/yHgY/CimRB5VfGzWjiV7Up1X6VRmn9Ik9Ya+TZZdGjLlfl4y14gkh0u08NBhY4MP4XshLiTNj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a5jCpCSl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a5jCpCSl"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55628eaec6cso735255e87.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jul 2025 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753349668; x=1753954468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
        b=a5jCpCSlmj87IOOm+0wkKsdl8ZdzFGIkwdEt9M6maV6Brhd9xM8iP4qUNktBupWN5L
         Dqa0Bog/Jqd7oxNAPsjpWOSA6swlrkeBk1jhb9iJE07kWSTlERXrapw0nRGST5YdT/uY
         X3hiy7tm57mI8ZXiOHw8ISXcLho2A0b91Agiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349668; x=1753954468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BiDDqrD6a5pZkcMdx9/g3Y4QyPCSLekJ/xiBVz6j3w=;
        b=kY+OVYkORECYqY7AtPpf8D1afqNk7fq3dZNfBViPr1J27J+GCYaaF5eNh7RhHTXK8C
         8uMzJwsJfgJ5zFmxMeZOu/kMBWlCY/hF5puK57VmrmkzS3ilLqpGxVluazSziqCSOIHW
         Gp/Jyi/sLbFkE/L5v8jjya4LKfa8ruDUkckCMCiw+oALGBTW8vD50STcTKFJYhvHoP6B
         GIvsDBytEsdViiOCOcn8dskdahKYntm9GzPCwYMaO/nCMBZn7TtVzFVjIpFhYCiLl8tR
         OdRfG1MoyEq6LVKri5PljmDS+M4MZ4OmEpIbO6gALNhlYbYlC+WSD01fH/1zNSZ49tG+
         rBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZKytGXysR5Lib56bgBA0TCOKEUVhSWvp9LZxiWtfdomBsUQUGBajWfgdW9UnV/zT4iHwxS/lwg5+gohAvDaXu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MtuWEpsy1ytcJFtkcQI84C25ceeRUjHpa/nM8S8j5JWLplZL
	vhzAvMNafG6Qi4DmEVMZs/xlngguu9iL+gUYLV0WY2cptdIHoouOpuHJcw4Ubd8QqIFEcvHXzzM
	efCF+/JSGV/0JJX6yRPlW5b/ifvcGhYbhVmPIa91A
X-Gm-Gg: ASbGncvN4WlyE0Ba71qVb3hhEa+26mSjVIEpxM49q+lM5Po9/57UEeSoOrYGb+6UVhX
	cPwbsj3G7I5SUt13q8Xzg0pZmOsMFQSgrfFUgywE3HpjSCUvdtrBzmNF3sh7so8/8j5jnDafVEi
	++JwVa3OYz9OO395hO2hyfoVWk7eq9lb1sTCGWIIGpBzMomXVugnryIw5WUDB9AFi+D5fNRsE2c
	Uk1T62G79puyBBiGLmOq5eRdDnWSF6YAjM=
X-Google-Smtp-Source: AGHT+IGbQGAzYrZuGKb7ZyVDVB2IA3/m7/1T14ShQ1gB/s052YEW14kETsBT1/6F7qIVfTgZAU3RoBMdAKdnokA3DJc=
X-Received: by 2002:a05:6512:2391:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-55a513bf799mr2287118e87.31.1753349667560; Thu, 24 Jul 2025
 02:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:34:15 +0800
X-Gm-Features: Ac12FXx-dC7GqsweL9em8IYbzr7gdu7h7TRc-hJouMaDYtIUw_U2Osb1ZV53HA8
Message-ID: <CAGXv+5ECM53Q4ndZ49Xa71mamy=GhGqdOMQYXydH6cEeT=0EgA@mail.gmail.com>
Subject: Re: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel
 node to machine dtsis
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Not all of the kukui machines have got a real DSI panel, infact,
> some of those have got a DSI to eDP bridge instead: this means
> that the address and size cells are necessary in the first case
> but unnecessary in the latter.
>
> Instead of adding a bunch of /delete-node/ which would impact on
> human readability, move the entire panel node declaration to each
> of the relevant Kukui machine dtsi: even though this introduces
> some duplication, the advantages in readability surclass that.

This is just an artifact of the lineage. Kukui the original design
was a tablet with MIPI DSI panels. Then the Jacuzzi clamshell design
with eDP panels was derived from that.

If we really don't like the duplication, maybe we could introduce
a `mt8183-kukui-tablet.dtsi` file for the bits that are specific
to the tablet design.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
>  5 files changed, 83 insertions(+), 28 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index f2afca63c75a..1b74ec171c10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
>         };
>  };
>
> -&dsi0 {
> -       status =3D "okay";
> -       /delete-node/panel@0;
> -};
> -
>  &dsi_out {
>         remote-endpoint =3D <&anx7625_in>;
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 472d4987615a..d71972c94e42 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -61,6 +61,33 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 1b21e3958061..b702ff066636 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
>         };
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a85c73b43195..b6cfcafd8b06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -45,6 +45,34 @@ &bluetooth {
>         firmware-name =3D "nvm_00440302_i2s_eu.bin";
>  };
>
> +&dsi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       status =3D "okay";
> +
> +       panel: panel@0 {
> +               /* compatible will be set in board dts */
> +               reg =3D <0>;
> +               enable-gpios =3D <&pio 45 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_pins_default>;
> +               avdd-supply =3D <&ppvarn_lcd>;
> +               avee-supply =3D <&ppvarp_lcd>;
> +               pp1800-supply =3D <&pp1800_lcd>;
> +               backlight =3D <&backlight_lcd0>;
> +               rotation =3D <270>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint =3D <&dsi_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_out {
> +       remote-endpoint =3D <&panel_in>;
> +};
> +
>  &i2c0 {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 8f3a0e85b4ed..4ac0a60fdd24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -252,29 +252,6 @@ &cpu7 {
>
>  &dsi0 {
>         status =3D "okay";
> -       #address-cells =3D <1>;
> -       #size-cells =3D <0>;
> -       panel: panel@0 {
> -               /* compatible will be set in board dts */
> -               reg =3D <0>;
> -               enable-gpios =3D <&pio 45 0>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&panel_pins_default>;
> -               avdd-supply =3D <&ppvarn_lcd>;
> -               avee-supply =3D <&ppvarp_lcd>;
> -               pp1800-supply =3D <&pp1800_lcd>;
> -               backlight =3D <&backlight_lcd0>;
> -               rotation =3D <270>;
> -               port {
> -                       panel_in: endpoint {
> -                               remote-endpoint =3D <&dsi_out>;
> -                       };
> -               };
> -       };
> -};
> -
> -&dsi_out {
> -       remote-endpoint =3D <&panel_in>;
>  };
>
>  &gic {
> --
> 2.50.1
>
