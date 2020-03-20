Return-Path: <linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org>
MIME-Version: 1.0
References: <20200320071143.4225-1-erin.lo@mediatek.com>
In-Reply-To: <20200320071143.4225-1-erin.lo@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Mar 2020 07:39:54 -0400
Message-ID: <CA+5PVA5pjvbJvMeKEARCAyztNAspqksfmCnV+ubO4OJnaQo5EA@mail.gmail.com>
Subject: Re: pull request v2: linux-firmware: Create Mediatek MT8183 SCP
 firmware
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org
To: Erin Lo <erin.lo@mediatek.com>
Cc: menghui.lin@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com, Nicolas Boichat <drinkcat@google.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-remoteproc@vger.kernel.org, Linux Firmware <linux-firmware@kernel.org>, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, Shawn Ku <shawnku@google.com>, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Mar 20, 2020 at 3:13 AM Erin Lo <erin.lo@mediatek.com> wrote:
>
> Hi, maintainers,
> Changes since v1:
>  - Add information to WHENCE
>
> The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:
>
>   Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/erinlo/linux_fw_scp v12573.77
>
> for you to fetch changes up to 3c213aa59661c4641f0c2166a315140ac0445230:
>
>   mediatek: Add mt8183 SCP firmware (2020-03-20 14:37:49 +0800)
>
> ----------------------------------------------------------------
> Erin Lo (1):
>       mediatek: Add mt8183 SCP firmware
>
>  WHENCE                  |  18 ++++++++++++++++++
>  mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
>  2 files changed, 18 insertions(+)
>  create mode 100644 mediatek/mt8183/scp.img

Pulled and pushed out.

josh

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
